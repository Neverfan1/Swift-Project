//
//  AlbumListView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel: AlbumListViewModel
    
    var body: some View {
        VStack{
            scrollContent
        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                   ToolbarItem(placement: .principal) {
                       TabBar(title: Strings.photoAlbum, refresh: true, action: onApperSend)
                   }
                   
        }
        .navigationTitle(Strings.photoAlbum)
    }
}

extension AlbumListView {
    
    
    var scrollContent: some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.output.album) { model in
                AlbumsCellView(model: model,
                               goToPhoto: viewModel.input.goToPhoto)
                Divider()
            }
        }
    }
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
}

//struct AlbumListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumListView()
//    }
//}
