//
//  LoginVKView.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//

import SwiftUI

struct LoginVKView: View {
    @StateObject var viewModel: LoginVKViewModel
    
    var body: some View {
        VStack{
            
            topImage
            AppButton(style: .authorization, title: Strings.authorization) {
                viewModel.input.authButtonTap.send()
            }
        }
    }
}

extension LoginVKView{
    var topImage: some View{
        Image("vk_logo")
            .renderingMode(.original)
            .resizable()
            .frame(width: 90, height: 90, alignment: .center)
            .cornerRadius(15)
            .padding(.bottom, 50)
        
    }
}

struct LoginVKView_Previews: PreviewProvider {
    static var previews: some View {
        LoginVKView(viewModel: LoginVKViewModel(router: AuthorizationCoordinator()))
    }
}
