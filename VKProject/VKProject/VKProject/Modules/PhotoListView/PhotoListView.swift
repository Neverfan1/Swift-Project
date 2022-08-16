//
//  PhotoListView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import SwiftUI

struct PhotoListView: View {
    
//    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = PhotoListViewModel()
    
    var body: some View {
        VStack{
            Text("Фотоальбомы")
                .bold()
                .font(.title)
                .onAppear(perform: onApperSend)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.output.photo) { model in
                    PhotoCellView(model: model)
                    Divider()
                }
            }
        }
        
//        .onChange(of: viewModel.output.error) { error in
//            if error {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
    }
}

extension PhotoListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView()
    }
}

