//
//  SettingsProfileView.swift
//  school
//
//  Created by Данила Парамин on 03.08.2022.
//

import SwiftUI

struct SettingsProfileView: View {
    
    let model: User
    
    var body: some View {
        
        VStack{
            HStack{
                Button(action: {}){
                avatar
                .padding(15)
                
                VStack(spacing: 5){
                    
                    fullName
                    phoneNumber
                    buttonVKID
                    
                }
                    
                chevronRight
                    
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width/1.03)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(14)
    }
}


private extension SettingsProfileView{
    
    var avatar: some View{
        VStack{
            Image("avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(100)
        }
            
    }
    
    var fullName: some View{
        Text(model.fullName)
            .font(.system(size: 15))
            .frame( maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.black)
    }
    
    var phoneNumber: some View{
        Text(model.numberPhone)
            .foregroundColor(Color.gray)
            .font(.system(size: 15))
            .frame( maxWidth: .infinity, alignment: .leading)
    }
    
    var buttonVKID: some View{
        Button("Управление VK ID"){}
            .frame( maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 15))
    }
    
    var chevronRight: some View{
        
        VStack{
            Image(systemName: "chevron.right")
                .padding()
                .foregroundColor(Color.gray.opacity(0.7))

            }
    }
}


struct SettingsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileView(model: .mock5())
    }
}
