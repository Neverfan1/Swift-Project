//
//  NavigationABC.swift
//  VKProject
//
//  Created by Данила Парамин on 01.09.2022.
//

import SwiftUI
import Combine

struct NavigationABC: View {
    
    let goToUserFunc: PassthroughSubject<Int, Never>
    @State  var text: String
    @State private var isEnabled = false
    
    var FriendArray: [FriendModel]

    var body: some View {
        
        ZStack{
            ScrollViewReader { value in
                HStack{
                    ScrollView(.vertical, showsIndicators: false) {
                        SearchBar(text: $text)
                        VStack(alignment: .leading){
                            ForEach(Strings.ABCRU, id: \.self){
                                textChar in
                                
                                charLine(char: textChar)
                                ForEach(text == "" ?  FriendArray:
                                            FriendArray.filter{
                                    $0.fullName.lowercased().contains(text.lowercased())}) { model in
                                        
                                        if model.lastName.prefix(1) == textChar{
                                            FriendsCellView(model: model, goToUser: goToUserFunc)
                                            Divider()
                                        }
                                        else if textChar == "#" && !Strings.ABCRU.contains(String(model.lastName.prefix(1))){
                                            FriendsCellView(model: model, goToUser: goToUserFunc)
                                            Divider()
                                            
                                        }
                                        
                                    }
                            }
                        }
                    }
                    Spacer()
                    navigation(value: value)
                }
            }
            
        }
    }
}

extension NavigationABC{
    
    struct charLine: View{
        var char: String
        var body: some View {
            HStack{
                Text(char)
                    .id(char)
                    .font(.system(size: 19, weight: .bold))
                    .padding(.leading, 5)
                
                
                Rectangle()
                    .fill(Color.primary.opacity(0.6))
                    .frame(height: 0.8)
            }
        }
    }
    
    struct navigation: View{
        let value: ScrollViewProxy
        
        var body: some View{
            VStack{
                ForEach(Strings.ABCRU, id: \.self){
                    navigationChar in
                    Button {
                        value.scrollTo(navigationChar, anchor: .top)
                    } label: {
                        Text(navigationChar)
                            .padding(.trailing, 5 )
                    }
                }
            }
        }
    }
    
}

