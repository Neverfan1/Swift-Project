//
//  AlbumsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//


import SwiftUI
import Kingfisher
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
            KFImage(URL(string:model.thumbSrc))
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 125)
            
            Text(model.title)
                .foregroundColor(Color.black)
            
            Text("Кол-во фотографий: \(model.size)")
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.caption2)
                .foregroundColor(.black)
                .opacity(0.4)
            
        }
    }
    



}

//struct AlbumsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumsCellView(model:.album_mock1())
//    }
//}
