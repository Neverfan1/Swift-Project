//
//  PhotoModelMapper.swift
//  VKProject
//
//  Created by Данила Парамин on 15.08.2022.
//

import Foundation

final class PhotoModelMapper: BaseModelMapper<ServerPhotoModel, PhotoModel> {
    
    override func toLocal(serverEntity: ServerPhotoModel) -> PhotoModel {

        PhotoModel(id: serverEntity.id ?? 0,
                   albumID: serverEntity.albumID ?? 0,
                   date: serverEntity.date ?? 0,
                   postID: serverEntity.postID ?? 0,
                   photoURL: mapPhoto(serverEntity.sizes),
                   likes: serverEntity.likes.count ?? 0,
                   comments: serverEntity.comments?.count ?? 0,
                   reposts: serverEntity.reposts?.count ?? 0)
    }
}

private extension PhotoModelMapper {
    func mapPhoto(_ photoURL: [Size]?) -> Size {
        photoURL?.last ?? Size(height: 0, url: "", type: "", width: 0)
    }
}

