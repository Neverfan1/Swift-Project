//
//  AuthorizationView.swift
//  school
//
//  Created by Данила Парамин on 21.07.2022.
//

import SwiftUI

struct AuthorizationView: View {
    
    @State private var input = ""
    
    @StateObject private var viewModel = AuthorizationViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            topImage
            titleView
                .padding()
                .padding(.horizontal, 30)
            AppTextField(text: $input)

            VStack(spacing: 15){
                
                    enterButton
                    subTitle
                    AppleButton
            }
            Spacer()
            regButton
            
        }
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}


private extension AuthorizationView{
    var topImage: some View{
        Image("vk_logo")
            .renderingMode(.original)
            .resizable()
            .frame(width: 90, height: 90, alignment: .center)
            .cornerRadius(15)
        
    }
    
    var titleView: some View{
        Text(viewModel.output.title)
            .font(.title2.bold())
        
    }
    
    var subTitle: some View{
        Text("Или с помощью")
                .font(.footnote)
                .opacity(0.4)
    }
    
    var enterButton: some View{
        AppButton(style: .button1,
                  title: "Войти",
                  action: enterButtonTap)
    }
    
    var AppleButton: some View{
        AppButton(style: .button2,
                  title: "Войти через Apple",
                  action: {})
    }
    
    var regButton: some View{
        AppButton(style: .button3,
                  title: "Зарегистрироваться",
                  action: {})
    }
}

private extension AuthorizationView{

    func enterButtonTap() {
        viewModel.input.enterButtonTap.send()
        
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
