//
//  GroupModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

struct GroupModel: Identifiable{
    
    let id: Int
    let description: String
    let name: String
    let screenName: String
    let isClosed: Int
    let type: String
    let photo100: String
    
        
}

extension GroupModel{

    static func group_mock1() -> Self {
        
        GroupModel(id: 1, description: "Описание", name: "Test", screenName: "Te", isClosed: 1, type: "page", photo100: "https....")
    }
    
}
