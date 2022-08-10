//
//  GroupListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct GroupListView: View {
    
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

