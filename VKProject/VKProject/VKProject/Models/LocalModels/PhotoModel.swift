//
//  PhotoModels.swift
//  VKProject
//
//  Created by Данила Парамин on 15.08.2022.
//

import Foundation
import UIKit


struct PhotoModel: Identifiable{
    
    let id: Int
    let albumID: Int
    let date: Int
    let postID: Int
    let photoURL: Size
    let likes: Int
}

extension PhotoModel{

    static func photo_mock1() -> Self {
        
PhotoModel(id: 1,
            albumID: 2,
            date: 3,
            postID: 4,
           photoURL: Size(height: 0, url: "https:\\test.com", type: "TEST", width: 0),
           likes: 100)
    }
    
}

