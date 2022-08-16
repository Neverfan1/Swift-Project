//
//  AlbumListView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import SwiftUI

struct AlbumListView: View {
    
//    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        VStack{
            Text("Фотоальбомы")
                .bold()
                .font(.title)
                .onAppear(perform: onApperSend)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.output.album) { model in
                    AlbumsCellView(model: model)
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

extension AlbumListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}

