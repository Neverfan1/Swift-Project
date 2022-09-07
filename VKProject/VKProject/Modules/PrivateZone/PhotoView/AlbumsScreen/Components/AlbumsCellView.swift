//
//  AlbumsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//


import SwiftUI
import Combine

struct AlbumsCellView: View {
    let model: AlbumModel
    let goToPhoto: PassthroughSubject<Int, Never>
    
    var body: some View {
        Button {
            goToPhoto.send(model.id)
        } label: {
            albums
        }
    }
}

private extension AlbumsCellView {
    
    var albums: some View{
        LazyVStack{
            NetworkImage(imageURL: URL(string:model.thumbSrc),
                         width: 150,
                         height: 150,
                         cornerRadius: 0)
            Text(model.title)
                .foregroundColor(Color.primary)
            
            Text(Strings.countPhotoColon + String(model.size))
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.caption2)
                .foregroundColor(.primary)
                .opacity(0.4)
            
        }
    }
}

//struct AlbumsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumsCellView(model:.album_mock1())
//    }
//}
