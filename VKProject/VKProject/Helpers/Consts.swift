//
//  Consts.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

struct Consts {
        
    struct VK {
        static let vkURL = "https://oauth.vk.com/authorize"
        static let clientIDKey = "client_id"
        static let clientIDValue = "51396220"
        static let displayKey = "display"
        static let displayValue = "mobile"
        static let scopeKey = "scope"
        static let scopeValue = "offline,photos"
        static let responseTypeKey = "response_type"
        static let responseTypeValue = "token"
        static let tokenKey = "access_token"
        //static let redirectUriKey = "redirect_uri"
        //static let redirectUriValue = "https://oauth.vk.com/blank.html"
    }
    
    struct MethodVK {
        static let baseVkURL = "https://api.vk.com"
    }
    
}
