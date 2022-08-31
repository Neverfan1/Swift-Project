//
//  UserView.swift
//  VKProject
//
//  Created by Данила Парамин on 24.08.2022.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel: UserViewModel
    
    //    let model: UserModel
    var body: some View {
        VStack{
            screenName
            
            ScrollView(.vertical, showsIndicators: false) {
                Divider()
                    
                    userHeader
                    friendButton
                    bdate
                    city
                    about
                    activities
                    education
                    friends
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width/1.04)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(14)
        .onAppear(perform: onApperSend)
        
    }
}

extension UserView{
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    var screenName: some View{
        HStack{
            if let model = viewModel.output.user {
                Text(model.screenName)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
            }
            
        }
        
    }
    
    var userHeader: some View{
        
        HStack{
            if let model = viewModel.output.user {
                NetworkImage(imageURL:URL(string:model.photoMaxOrig),
                             width: 75,
                             height: 75,
                             cornerRadius: 100)
                
                VStack(alignment: .leading){
                    HStack{
                        Text(model.fullName)
                            .fontWeight(.bold)
                            .padding(.top,15)
                        if model.online == 1{
                            if model.onlineMobile == 1{
                                Image(systemName: "iphone.homebutton")
                                    .foregroundColor(Color.green)
                                    .frame(width: 10, height: 10)
                                    .padding(.top,15)
                            }
                            else{
                                Circle()
                                    .foregroundColor(Color.green)
                                    .frame(width: 10, height: 10)
                                    .padding(.top,15)
                            }
                        }
                        
                    }
                    
                    Text(model.status)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                
                Spacer()
            }
        }
        .padding(.bottom, 15)
        
    }
    
    var friendButton: some View{
        HStack{
            Button(action: {}){
                Image(systemName: "person.fill.checkmark")
                    .foregroundColor(.primary)
                Text(Strings.inFriendsColon)
                    .foregroundColor(.primary)
                
            }
            .frame(width: 180, height: 40)
            
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.primary, lineWidth: 2)
            )
            .padding(.bottom, 20)
        }
    }
    
    
    @ViewBuilder var bdate: some View{
        if let model = viewModel.output.user {
            if model.bdate != "" {
                HStack{
                    Text(Strings.bdateColon + converterDate(inputDate: model.bdate))
                    Spacer()
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    @ViewBuilder var city: some View{
        if let model = viewModel.output.user {
            if model.city != "" {
                HStack{
                    Text(Strings.cityColon + model.city)
                    Spacer()
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    @ViewBuilder var about: some View{
        if let model = viewModel.output.user {
            if model.about != "" {
                HStack{
                    Text(Strings.aboutColon + model.about)
                    Spacer()
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    @ViewBuilder var activities: some View{
        if let model = viewModel.output.user {
            if model.activities != "" {
                HStack{
                    Text(Strings.activitiesColon + model.activities)
                    Spacer()
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    @ViewBuilder var education: some View{
        if let model = viewModel.output.user {
            if model.education != ", " {
                HStack{
                    Text(Strings.educationColon + model.education)
                    Spacer()
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    @ViewBuilder var friends: some View{
        if let model = viewModel.output.user {
            HStack{
                Text(Strings.friendsColon + String(model.friends))
                Spacer()
            }
            .padding(.bottom, 15)
        }
    }
    
    //    var mutualFriends: some View{
    //        HStack{
    //            Text("Общие друзья: \(model.mutualFriends)")
    //            Spacer()
    //        }
    //
    //    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel:UserViewModel.init(userID: 703747841) )
    }
}
