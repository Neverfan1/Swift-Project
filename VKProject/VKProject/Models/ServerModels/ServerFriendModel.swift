//
//  ServerFriendModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

struct ServerResponse1: Decodable {
    let response: ServerFriendResponse
}

struct ServerFriendResponse: Decodable {
    let count: Int
    let items: [ServerFriendModel]
}

struct ServerFriendModel: Decodable {
    let id: Int
    let online: Int?
    let onlineMobile: Int?
    let trackCode: String?
    let firstName: String?
    let lastName: String?
    let canAccessClosed: Bool?
    let isClosed: Bool?
    let photoMax: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case online = "online"
        case onlineMobile = "online_mobile"
        case trackCode = "track_code"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case photoMax = "photo_max"
    }
}
