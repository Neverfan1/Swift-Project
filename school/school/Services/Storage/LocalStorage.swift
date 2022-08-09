//
//  LocalStorage.swift
//  school
//
//  Created by Данила Парамин on 08.08.2022.
//

import Foundation


enum LocalStorageKey: String {
    case token
    case vkID
}

typealias Token = String

struct LocalStorage {
    
    private let userDefaults = UserDefaults.standard
    
    static var current = LocalStorage()
    
    private init() {}
    
    func setToken(token: Token) {
        userDefaults.set(token, forKey: LocalStorageKey.token.rawValue)
    }
    
    func getToken() -> String? {
        userDefaults.string(forKey: LocalStorageKey.token.rawValue)
    }
    
    var vkID: Int? {
        get {
            userDefaults.integer(forKey: LocalStorageKey.vkID.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.vkID.rawValue)
        }
    }
    
}
