//
//  PhotoCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import SwiftUI

struct PhotoCellView: View {
    
    let model: PhotoModel
    
    var body: some View {
        LazyVStack{
            photo
            likes
        }
    }
}

private extension PhotoCellView {
    
    var likes: some View{
        HStack{
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red)
            Text(String(model.likes))
            Image(systemName: "bubble.left.fill")
                .foregroundColor(Color.blue)
            Text(String(model.comments))
            Image(systemName: "square.and.arrow.up.fill")
                .foregroundColor(Color.blue)
            Text(String(model.reposts))
        }
    }
    
    var photo: some View{
        NetworkImage(imageURL: URL(string:model.photoURL.url!),
                     width: 185,
                     height: 140,
                     cornerRadius: 0)
    }
}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(model:.photo_mock1())
    }
}

