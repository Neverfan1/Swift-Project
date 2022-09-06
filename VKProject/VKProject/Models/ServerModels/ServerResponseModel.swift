//
//  ServerResponseModel.swift
//  VKProject
//
//  Created by Данила Парамин on 04.09.2022.
//

import Foundation

struct ServerListResponse<T>: Decodable where T: Decodable {
    let response: ServerModelResponse<T>
}

struct ServerModelResponse<Content: Decodable>: Decodable {
    let count: Int
    let items: [Content]
}

struct ServerResponse<Content: Decodable>: Decodable {
    let response: [Content]
}
