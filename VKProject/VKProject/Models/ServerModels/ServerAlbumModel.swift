//
//  ServerAlbumModel.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//


import Foundation

// MARK: - Item
struct ServerAlbumModel: Codable {
    let id, ownerID, size: Int?
    let title: String?
    let canDelete: Bool?
    let thumbID: Int?
    let thumbSrc: String?

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case size, title
        case canDelete = "can_delete"
        case thumbID = "thumb_id"
        case thumbSrc = "thumb_src"
    }
}
