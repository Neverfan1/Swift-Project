//
//  LocalStorage.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Combine


enum LocalStorageKey: String {
    case token
    case vkId
    case expiresIn
    case albumID
    case isComplited
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
    
    var albumID: Int? {
        
        get {
            userDefaults.integer(forKey: LocalStorageKey.albumID.rawValue)
        }
        
        set{
            userDefaults.set(newValue, forKey: LocalStorageKey.albumID.rawValue)
        }
    }
    
    var isComplited: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isComplited")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isComplited")
        }
    }
}

struct AuthenticationLocalService {
    
    static var shared = AuthenticationLocalService()
    let status: CurrentValueSubject<Bool, Never>
    
    private init() {
        self.status = CurrentValueSubject<Bool, Never>(LocalStorage.current.isComplited)
    }
}

