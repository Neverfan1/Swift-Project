//
//  FriendsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI
import Kingfisher

struct FriendsCellView: View {
    let model: FriendModel
    
    var body: some View {
        HStack {
            userPhoto
            userName
            Spacer()
            statusOnline
        }
        .padding()
    }
}

private extension FriendsCellView {
    
    var userPhoto: some View{
            KFImage(URL(string: model.photoMax))
            .renderingMode(.original)
            .resizable()
            .frame(width: 43, height: 43)
            .cornerRadius(100)
    }
    
    var statusOnline: some View{
        VStack{
        if model.online == 1{
            if model.onlineMobile == 1{
                Image(systemName: "iphone.homebutton")
                   .foregroundColor(Color.green)
                   .frame(width: 10, height: 10)
            }
            else{
            Circle()
               .foregroundColor(Color.green)
               .frame(width: 10, height: 10)
            }
            }
        }
    }
    
    var userName: some View{
        Text(model.fullName)
            .bold()
    }

}

struct FriendsCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsCellView(model: .friend_mock1())
    }
}

// "https://sun7.userapi.com/sun7-6/s/v1//ig2/a3eaFyr7RMnNNUFzm42SdijujKobN38v7x7PI4WnebrPl6bFR-XeFU5_bWEz1wnpO1ZZOE3mZLYLAO3Vk7EXf6xS.jpg?size=50x50&quality=95&crop=0,0,530,530&ava=1"
