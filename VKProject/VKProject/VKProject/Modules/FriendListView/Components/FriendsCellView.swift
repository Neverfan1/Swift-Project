//
//  FriendsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct FriendsCellView: View {
    let model: FriendModel
    
    var body: some View {
        HStack {
            userName
            Spacer()
            statusOnline
        }
        .padding()
    }
}

private extension FriendsCellView {
    
    var statusOnline: some View{
        VStack{
        if model.online == 1{
            Circle()
               .foregroundColor(Color.green)
               .frame(width: 10, height: 10)
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

