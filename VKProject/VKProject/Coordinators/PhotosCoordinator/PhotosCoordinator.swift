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
    
    @Route(.push) var photo = makePhotos
    
    init() {
        print("Я Родился!")
    }
    
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension PhotosCoordinator {
    
    @ViewBuilder func makeAlbums() -> some View {
        let viewModel = AlbumListViewModel(router: self, api: VKAPIService())
        AlbumListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makePhotos(id: Int) -> some View {
        let viewModel = PhotoListViewModel(albumID: id, api: VKAPIService())
        PhotoListView(viewModel: viewModel)
    }
}


