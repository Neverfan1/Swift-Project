//
//  FriendsRouter.swift
//  VKProject
//
//  Created by Данила Парамин on 24.08.2022.
//

import Foundation


protocol FriendsRouter: AnyObject {
    func goToUser(id: Int)
}

extension FriendsCoordinator: FriendsRouter {
    
    func goToUser(id: Int) {
        self.route(to: \.user, id)
    }
}
