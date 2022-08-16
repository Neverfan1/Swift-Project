//
//  AlbumModel.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import Foundation
import UIKit


struct AlbumModel: Identifiable{
    
    let id: Int
    let size: Int
    let title: String
    let thumbSrc: String
}

extension AlbumModel{

    static func album_mock1() -> Self {
        
        AlbumModel(id: 1, size: 100, title: "TestTtitle", thumbSrc: "https:\\test.com")
        
    }
}

