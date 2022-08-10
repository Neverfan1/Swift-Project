//
//  FriendsListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @StateObject var viewModel2 = FriendListViewModel()
    
    var body: some View {
        VStack{
            Text("Друзья")
                .bold()
                .font(.title)
                .onAppear(perform: onApperSend2)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel2.output.friends) { model in
                    FriendsCellView(model: model)
                    Divider()
                }
            }
        }
    }
}

extension FriendsListView {
    
    func onApperSend2() {
        viewModel2.input.onAppear.send()
    }
    
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
