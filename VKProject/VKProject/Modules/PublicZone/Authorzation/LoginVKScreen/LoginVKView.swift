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
            Button {
                viewModel.input.authButtonTap.send()
            } label: {
                Text("Авторизоваться через VKID")
            }

        }
    }
}

struct LoginVKView_Previews: PreviewProvider {
    static var previews: some View {
        LoginVKView(viewModel: LoginVKViewModel(router: AuthorizationCoordinator()))
    }
}
