//
//  FriendsListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @StateObject var viewModel2 = FriendListViewModel()
    
    @State private var button1 = false
    @State private var button2 = true
    @State private var isEnabled = false
    
    var body: some View {
        VStack{
            header
            buttons
            scrollContent
            
        }
        
    }
}

extension FriendsListView {
    
    var onlineButton: some View{
        Button("Онлайн") {
            isEnabled = true
            button1 = true
            button2 = false
            
        }
        .padding(5)
        .font(.caption)
        .foregroundColor(.black.opacity(0.4))
        
    }
    
    var allButton: some View{
        
        Button("Все"){
            isEnabled = false
            button1 = false
            button2 = true
        }
        .padding(5)
        .font(.caption)
        .foregroundColor(.black.opacity(0.4))
    }
    
    var header: some View{
        Text("Друзья")
            .bold()
            .font(.title)
            .onAppear(perform: onApperSend2)
    }
    
    var buttons: some View{
        HStack{
            if isEnabled{
                allButton
                onlineButton.background(Color.gray)
                
            }
            else{
                allButton.background(Color.gray)
                onlineButton
            }
            
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(30)
    }
    
    var scrollContent: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            PullToRefreshView {onApperSend2() }
            ForEach(viewModel2.output.friends) { model in
                if model.online == 1 && button1{
                    FriendsCellView(model: model)
                    Divider()
                }
                if button2{
                    FriendsCellView(model: model)
                    Divider()
                }
            }
        }
    }
    
    
    
    func onApperSend2() {
        viewModel2.input.onAppear.send()
    }
    
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
//
//var online: some View{
//    ScrollView(.vertical, showsIndicators: false) {
//        ForEach(viewModel2.output.friends) { model in
//            if model.online == 1{
//            FriendsCellView(model: model)
//            Divider()
//            }
//        }
//    }
//
//}
