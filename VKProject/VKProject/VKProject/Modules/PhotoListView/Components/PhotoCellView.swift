//
//  PhotoCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import SwiftUI
import Kingfisher

struct PhotoCellView: View {
    let model: PhotoModel

    
    var body: some View {
        LazyVStack{
            KFImage(URL(string:model.photoURL.url!))
                .renderingMode(.original)
                .resizable()
                .frame(width: 185, height: 140)
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(Color.red)
                Text(String(model.likes))
            }
        }
    }
}

private extension PhotoCellView {


}

struct PhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCellView(model:.photo_mock1())
    }
}

