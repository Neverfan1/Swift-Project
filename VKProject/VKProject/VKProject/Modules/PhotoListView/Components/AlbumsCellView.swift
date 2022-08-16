//
//  AlbumsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//


import SwiftUI
import Kingfisher

struct AlbumsCellView: View {
    let model: AlbumModel

    
    var body: some View {
        
        Button {
            LocalStorage.current.albumID = model.id
        } label: {
            LazyVStack{
                Text(model.title)
                KFImage(URL(string:model.thumbSrc))
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height: 125)
                
            }
        }


    }
}

private extension AlbumsCellView {


}

struct AlbumsCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsCellView(model:.album_mock1())
    }
}
