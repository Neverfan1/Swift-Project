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
    
    var body: some View {
        VStack{
            Text("Друзья")
                .bold()
                .font(.title)
                .onAppear(perform: onApperSend2)
            HStack{
                Button("Онлайн") {
                    button1 = true
                    button2 = false

                }

                Button("Все"){
                    button1 = false
                    button2 = true
                }
            }
            .background(Color.black.opacity(0.7))
            .cornerRadius(30)
            
            

                ScrollView(.vertical, showsIndicators: false) {
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
