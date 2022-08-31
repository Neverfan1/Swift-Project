//
//  FriendsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI
import Combine

struct FriendsCellView: View {
    let model: FriendModel
    let goToUser: PassthroughSubject<Int, Never>
    
    var body: some View {
        
        Button {
            goToUser.send(model.id)
        } label: {
            HStack {
                userPhoto
                userName
                Spacer()
                statusOnline
            }
            .padding()
        }
    }
}

private extension FriendsCellView {
    
    var userPhoto: some View{
        NetworkImage(imageURL: URL(string: model.photoMax),
                     width: 43,
                     height: 43,
                     cornerRadius: 100)
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

//struct FriendsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsCellView(model: .friend_mock1(), goToUser: )
//    }
//}


