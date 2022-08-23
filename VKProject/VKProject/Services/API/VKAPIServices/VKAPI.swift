//
//  VKAPI.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Moya

enum VKAPI {
    case getFriends
    case getGroups
    case getNewsFeed
    case getPhoto(id: Int)
    case getAlbums

    
}


extension VKAPI: TargetType {
    var baseURL: URL {
        URL(string: Consts.MethodVK.baseVkURL)!
    }
    
    var path: String {
        switch self {
        case .getFriends:
            return "method/friends.get"
        case  .getGroups:
            return "method/groups.get"
        case .getNewsFeed:
            return "method/newsfeed.get"
        case .getPhoto:
            return "method/photos.get"
        case .getAlbums:
            return "method/photos.getAlbums"

            
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .getFriends:
            var param: [String: Any] = [:]
            param["access_token"] = LocalStorage.current.token
            param["count"] = 1000
            param["fields"] = "online,photo_Max"
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        
        case .getGroups:
            var param: [String: Any] = [:]
            param["access_token"] = LocalStorage.current.token
            param["extended"] = 1
            param["fields"] = "description,photo_200,activity,members_count,age_limits"
//            param["count"] = 10
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        
        case .getNewsFeed:
            var param: [String: Any] = [:]
            param["access_token"] = LocalStorage.current.token
            param["filters"] = "post"
            param["max_photos"] = 10
            param["fields"] = "name,photo_200"
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        case let .getPhoto(id):
            var param: [String: Any] = [:]
            param["access_token"] = LocalStorage.current.token
            param["owner_id"] = LocalStorage.current.vkId
            param["album_id"] = id
            param["extended"] = 1
            param["rev"] = 1
            param["offset"] = 0
            param["count"] = 1000
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        case .getAlbums:
            var param: [String: Any] = [:]
            param["access_token"] = LocalStorage.current.token
            param["owner_id"] = LocalStorage.current.vkId
            param["need_system"] = 1
            param["need_covers"] = 1
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        }
}
    
    var headers: [String : String]? {
        [:]
    }
}
