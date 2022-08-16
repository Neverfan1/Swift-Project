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
                   activity: serverEntity.activity.orEmpty)
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
}

