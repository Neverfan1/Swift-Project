//
//  Conts.swift
//  school
//
//  Created by Данила Парамин on 08.08.2022.
//

import Foundation

struct Consts {
    
    struct BaseAPI {
        static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    struct VK {
        static let vkURL = "https://oauth.vk.com/authorize"
        static let clientIDKey = "client_id"
        static let clientIDValue = "8233932"
        static let displayKey = "display"
        static let displayValue = "mobile"
        static let scopeKey = "scope"
        static let scopeValue = "12"
        static let responseTypeKey = "response_type"
        static let responseTypeValue = "token"
        static let redirectUriKey = "redirect_uri"
        static let redirectUriValue = "https://oauth.vk.com/blank.html"
    }
    
    struct VKGroup{
        static let vkURL = "https://api.vk.com/method/groups.get"
        static let userIDKey = "user_id"
        static let userIDValue = "154032007"
        static let extendedKey = "extended"
        static let extendedValue = "1"
        static let countKey = "count"
        static let countValue = "10"
        static let accessTokenKey = "access_token"
        static let accessTokenValue = "vk1.a.8Kxbd5357vumO-oxOJ32Po93ipqlcSsxSrWe3o3e7h5PQAlPkQD-LbRkVhGnzX108I24ZRCK83iVo1WK4K2PR7nvcrFLcSJpPzREfR6j7W0JCI38iT6kY8EV_uvTobG14tnX50fIFZ6hADp0V_QUx1Wivl6X9hD5ZcVjtS3PfAmTE4IP2aYPxgMZ6c3cRaff"
        static let versionKey = "v"
        static let versionValue = "5.131"
    }
    
}
