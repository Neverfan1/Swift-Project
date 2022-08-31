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
    
    var body: some View {
        
        VStack{
            scrollContent
            
        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Strings.friends)
        
        
    }
    
}

extension FriendsListView {
    
    var onlineButton: some View{
        Button(Strings.online) {
            isEnabled = true
            
        }
        .padding(5)
        .font(.caption)
        .foregroundColor(.black.opacity(0.4))
        .padding(.horizontal, 7)
        
    }
    
    var allButton: some View{
        Button(Strings.all) {
            isEnabled = false
        }
        .padding(5)
        .font(.caption)
        .foregroundColor(.black.opacity(0.4))
        .padding(.horizontal, 7)
    }
    
    var buttons: some View{
        HStack{
            if isEnabled{
                allButton.padding(.horizontal, 7)
                Spacer()
                onlineButton.background(Color.gray).cornerRadius(10).padding(.horizontal, 7)
                
            }
            else{
                allButton.background(Color.gray).cornerRadius(10).padding(.horizontal, 7)
                Spacer()
                onlineButton.padding(.horizontal, 7)
                
            }
            
        }
    }
    
    var scrollContent: some View{
        ScrollView(.vertical, showsIndicators: false) {
            PullToRefreshView {onApperSend() }
            SearchBar(text: $text)
            buttons
            ForEach(text == "" ?  viewModel.output.friends:
                        viewModel.output.friends.filter{
                $0.fullName.lowercased().contains(text.lowercased())}) { model in
                    if model.online == 1 && isEnabled{
                        FriendsCellView(model: model, goToUser: viewModel.input.goToUser)
                        Divider()
                    }
                    if !isEnabled{
                        FriendsCellView(model: model, goToUser: viewModel.input.goToUser)
                        Divider()
                    }
                }
        }
    }
    
    
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

//struct FriendsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsListView(viewModel: FriendListViewModel())
//    }
//}

