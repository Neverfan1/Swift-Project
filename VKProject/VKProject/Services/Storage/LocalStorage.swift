//
//  LocalStorage.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation


enum LocalStorageKey: String {
    case token
    case vkId
    case expiresIn
}

struct LocalStorage {
    
    private let userDefaults = UserDefaults.standard
    
    static var current = LocalStorage()
    
    private init(){}
    
    var vkId: Int? {
        
        get {
            userDefaults.integer(forKey: LocalStorageKey.vkId.rawValue)
        }
        
        set{
            userDefaults.set(newValue, forKey: LocalStorageKey.vkId.rawValue)
        }
    }
    
    var token: String? {
        
        get {
            userDefaults.string(forKey: LocalStorageKey.token.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.token.rawValue)
        }
    }
    
    var expiresIn: String? {
        get {
            userDefaults.string(forKey: LocalStorageKey.expiresIn.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: LocalStorageKey.expiresIn.rawValue)
        }
    }
}

