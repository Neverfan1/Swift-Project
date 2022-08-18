//
//  ServerGroupModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

struct ServerResponse2: Decodable {
    let response: ServerGroupResponse
}

// MARK: - Response
struct ServerGroupResponse: Decodable {
    let count: Int
    let items: [ServerGroupModel]
}

struct ServerGroupModel: Decodable{
    
    let id: Int
    let description: String?
    let name: String?
    let screenName: String?
    let isClosed: Int?
    let type: String?
    let photo200: String?
    let activity: String?
    let membersCount: Int?
    let ageLimits: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
        case name = "name"
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type = "type"
        case photo200 = "photo_200"
        case activity = "activity"
        case membersCount = "members_count"
        case ageLimits = "age_limits"
    }
}

