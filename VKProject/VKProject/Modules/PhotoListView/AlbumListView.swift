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
            header
            scrollContent
        }
        
//        .onChange(of: viewModel.output.error) { error in
//            if error {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
    }
}

extension AlbumListView {
    
    var header: some View{
        Text("Фотоальбомы")
            .bold()
            .font(.title)
            .onAppear(perform: onApperSend)
    }
    
    var scrollContent: some View{
        ScrollView(.vertical, showsIndicators: false) {
            PullToRefreshView {onApperSend() }
            ForEach(viewModel.output.album) { model in
                AlbumsCellView(model: model)
                Divider()
            }
        }
    }
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}

