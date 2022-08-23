//
//  LoginVKRouter.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//

import Foundation

protocol LoginVKRouter: AnyObject {
    func goToWebView()
}

extension AuthorizationCoordinator: LoginVKRouter {
    func goToWebView() {
        self.route(to: \.webLogin)
    }
}
