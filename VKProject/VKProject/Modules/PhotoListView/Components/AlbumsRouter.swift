//
//  AlbumsRouter.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//

import Foundation

protocol AlbumsRouter: AnyObject {
    func goToPhoto()
}

extension PhotoAlbumsCoordinator: AlbumsRouter {
    func goToPhoto() {
        self.route(to: \.photo)
    }
    
}
