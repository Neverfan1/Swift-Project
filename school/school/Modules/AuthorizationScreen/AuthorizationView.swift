//
//  AuthorizationView.swift
//  school
//
//  Created by Данила Парамин on 21.07.2022.
//

import SwiftUI

struct AuthorizationView: View {
    
    @State private var input = ""
    
    let viewModel = AuthorizationViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Image("vk_logo")
                .renderingMode(.original)
                .resizable()
                .frame(width: 90, height: 90, alignment: .center)
                .cornerRadius(15)

            Text("Вход в VK ID")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2.bold())
            
            
            VStack{
                TextField("Телефон или почта", text: $input)
                    .padding()
                    .background(Color.gray.opacity(0.17))
                    .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(.gray.opacity(0.34),lineWidth: 3)
                            )
                    .cornerRadius(14)
                    .padding(.horizontal, 12)
                    .font(.callout)
                    .padding(.bottom, 5)
                

            }
            
            VStack(spacing: 15){
            
            AppButton(style: .button1,
                      title: "Войти")
            Text("Или с помощью")
                    .font(.footnote)
                    .opacity(0.4)
            AppButton(style: .button2,
                      title: "Войти через Apple")


            }
            Spacer()
            VStack{
            AppButton(style: .button3,
                      title: "Зарегистрироваться")
            }
        }
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
