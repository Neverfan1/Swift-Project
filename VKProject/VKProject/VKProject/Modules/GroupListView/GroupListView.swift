//
//  GroupListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct GroupListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = GroupListViewModel()
    
    var body: some View {
        VStack{
            Text("Группы")
                .bold()
                .font(.title)
                .onAppear(perform: onApperSend)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.output.groups) { model in
                    GroupsCellView(model: model)
                    Divider()
                }
            }
        }
        .onChange(of: viewModel.output.error) { error in
            if error {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

extension GroupListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}

