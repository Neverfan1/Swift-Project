//
//  FriendModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

struct FriendModel: Identifiable {
    let id: Int
    let online: Int
    let onlineMobile: Int
    let trackCode: String
    let firstName: String
    let lastName: String
    let canAccessClosed: Bool
    let isClosed: Bool
    let photoMax: String
    
    var fullName: String {
        "\(lastName) \(firstName)"
    }
}



extension FriendModel{

    static func friend_mock1() -> Self {
        
      FriendModel(id: 1, online: 1, onlineMobile: 1, trackCode: "test", firstName: "FirstName", lastName: "LastName", canAccessClosed: true, isClosed: true, photoMax: "https:\\32131")

    }
    
}
