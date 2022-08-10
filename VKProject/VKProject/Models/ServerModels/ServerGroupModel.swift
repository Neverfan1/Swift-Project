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
    let photo100: String?
    
    
    enum CodingKeys2: String, CodingKey {
        case id = "id"
        case description = "description"
        case name = "name"
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type = "type"
        case photo100 = "photo_100"
    }
}

