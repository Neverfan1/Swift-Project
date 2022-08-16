//
//  AlbumModelMapper.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import Foundation

final class AlbumModelMapper: BaseModelMapper<ServerAlbumModel, AlbumModel> {
    
    override func toLocal(serverEntity: ServerAlbumModel) -> AlbumModel {
        
        AlbumModel(id: serverEntity.id ?? 0,
                   size: serverEntity.size ?? 0,
                   title: serverEntity.title.orEmpty,
                   thumbSrc: serverEntity.thumbSrc.orEmpty)

    }
}

