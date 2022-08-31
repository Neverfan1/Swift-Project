//
//  AlbumsRouter.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//

import Foundation


protocol AlbumsRouter: AnyObject {
    func goToPhoto(id: Int)
}

extension PhotosCoordinator: AlbumsRouter {
    
    func goToPhoto(id: Int) {
        self.route(to: \.photo, id)
    }
}
