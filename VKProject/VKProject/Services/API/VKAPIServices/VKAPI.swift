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
            param["fields"] = "online"
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        
        case .getGroups:
            var param: [String: Any] = [:]
            param["access_token"] = LocalStorage.current.token
            param["extended"] = 1
            param["fields"] = "description"
            param["count"] = 1000
            param["v"] = "5.131"
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
}
    
    var headers: [String : String]? {
        [:]
    }
}
