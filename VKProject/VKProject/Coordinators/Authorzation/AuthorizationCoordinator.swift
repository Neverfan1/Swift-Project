//
//  AuthorizationCoordinator.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//

import Foundation
import Foundation
import SwiftUI
import Stinsen

final class AuthorizationCoordinator: NavigationCoordinatable, WebRouter {
    
    let stack = NavigationStack(initial: \AuthorizationCoordinator.loginVK)
    
    @Root var loginVK = makeLogin
    @Route(.modal) var webLogin = makeWebLogin
    
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension AuthorizationCoordinator {
    
    @ViewBuilder func makeLogin() -> some View {
        let viewModel = LoginVKViewModel(router: self)
        LoginVKView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeWebLogin() -> some View {
        let viewModel = WebViewRepresentableModel()
        WebView(viewModel: viewModel)
    }
}
