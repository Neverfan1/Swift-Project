//
//  FriendsListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @StateObject var viewModel: FriendListViewModel
    
    @State private var text = ""
    
    @State private var isEnabled = false
    @State  var OnlineArray = []
    @State  var OfflineArray = []
    var body: some View {
        
        VStack{
            NavigationABC(goToUserFunc: viewModel.input.goToUser, text: text, FriendArray: viewModel.output.friends)

        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                   ToolbarItem(placement: .principal) {
                       TabBar(title: Strings.friends, refresh: true, action: onApperSend)
                   }
                   
        }
        .navigationTitle(Strings.friends)
        
        
    }
    
}

extension FriendsListView {
        
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}
