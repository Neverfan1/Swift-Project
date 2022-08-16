//
//  ServerPhotoModel.swift
//  VKProject
//
//  Created by Данила Парамин on 15.08.2022.
//

import Foundation

// MARK: - Welcome
struct ServerResponse3: Codable {
    let response: ServerPhotoResponse
}

// MARK: - Response
struct ServerPhotoResponse: Codable {
    let count: Int
    let items: [ServerPhotoModel]
}

// MARK: - Item
struct ServerPhotoModel: Codable {
    let albumID, date, id, ownerID: Int?
    let lat, long: Double?
    let canComment: Int?
    let sizes: [Size]?
    let text: String?
    let hasTags: Bool?
    let likes: Likes
    let comments, reposts, tags: Comments?
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case lat, long
        case canComment = "can_comment"
        case sizes, text
        case hasTags = "has_tags"
        case likes, comments, reposts, tags
        case postID = "post_id"
    }
}

// MARK: - Comments
struct Comments: Codable {
    let count: Int?
}

// MARK: - Likes
struct Likes: Codable {
    let count, userLikes: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

// MARK: - Size
struct Size: Codable {
    let height: Int?
    let url: String?
    let type: String?
    let width: Int?
}

