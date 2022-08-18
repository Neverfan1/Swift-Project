//
//  PhotoAlbumsCoordinators.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class PhotoAlbumsCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \PhotoAlbumsCoordinator.albums)
    
    @Root var albums = makeAlbums
    
    @Route(.push) var photo = makePhoto
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension PhotoAlbumsCoordinator {
    
    @ViewBuilder func makeAlbums() -> some View {
//        let viewModel = AlbumListViewModel(router: self)
//        AlbumListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makePhoto() -> some View {
        let viewModel = PhotoListViewModel()
        PhotoListView(viewModel: viewModel)
    }
}
