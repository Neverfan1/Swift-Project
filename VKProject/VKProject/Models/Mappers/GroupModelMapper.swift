//
//  GroupModelMapper.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

final class GroupModelMapper: BaseModelMapper<ServerGroupModel, GroupModel> {
    
    override func toLocal(serverEntity: ServerGroupModel) -> GroupModel {
        GroupModel(id: serverEntity.id ,
                   description: serverEntity.description.orEmpty,
                   name: serverEntity.name.orEmpty ,
                   screenName: serverEntity.screenName.orEmpty ,
                   isClosed: serverEntity.isClosed ?? 0,
                   type: serverEntity.type.orEmpty ,
                   photo200: replaseSlash(groupURL: serverEntity.photo200),
                   activity: serverEntity.activity.orEmpty,
                   membersCount: serverEntity.membersCount ?? 0,
                   ageLimits: age(serverEntity.ageLimits))
    }
}

private extension GroupModelMapper {
    func replaseSlash(groupURL: String?) -> String {
        if groupURL == nil{
            return ""
        }
        else{
            return  groupURL!.replacingOccurrences(of: "\\/", with: "/", options: .literal)
        }
        
    }
    
    func age (_ ageLimits: Int?) -> String{
       var limit = ""
        if ageLimits == nil{
            limit = ""
        }
        else{
            if ageLimits == 1 {
                limit = "Нет"
            }
            if ageLimits == 2{
                 limit = "16+"
            }
            if ageLimits == 3{
                 limit = "18+"
            }
        }
        return limit
    }
}

