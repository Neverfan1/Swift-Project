//
//  PhotosCoordinator.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//


import Foundation
import SwiftUI
import Stinsen

final class PhotosCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \PhotosCoordinator.start)
    
    @Root var start = makeAlbums
    
    @Route(.modal) var photo = makePhotos
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension PhotosCoordinator {
    
    @ViewBuilder func makeAlbums() -> some View {
        let viewModel = AlbumListViewModel(router: self)
        AlbumListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makePhotos() -> some View {
        PhotoListView()
    }
}


