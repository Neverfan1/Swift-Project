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
    let photo200: String
    let activity: String
    
        
}

extension GroupModel{

    static func group_mock1() -> Self {
        
        GroupModel(id: 1,
                   description: "description",
                   name: "Test",
                   screenName: "Te",
                   isClosed: 1,
                   type: "page",
                   photo200:"https://www.interfax.ru/ftproot/photos/photostory/2022/04/29/week/week7_1100.jpg",
                   activity: "activity")
    }
    
}
