//
//  MainCoordinator.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    
    var stack: NavigationStack<MainCoordinator>
    
    @Root var photoAlbums = makePhotoAlbums

    //@Root var general = makeChildGeneral
    
    @ViewBuilder func sharedView(_ view: AnyView) -> some View {
        view
    }
    
    init() {
        stack = NavigationStack(initial: \MainCoordinator.photoAlbums)
    }
}

extension MainCoordinator {
    
    
    func makePhotoAlbums() -> NavigationViewCoordinator<PhotoAlbumsCoordinator> {
        let coordinator = PhotoAlbumsCoordinator()
        let stack = NavigationViewCoordinator(coordinator)
        return stack
    }
}
