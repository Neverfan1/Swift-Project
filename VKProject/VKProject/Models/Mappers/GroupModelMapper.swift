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
                   photo200: replaseSlash(groupURL: serverEntity.photo200) ,
                   activity: serverEntity.activity.orEmpty,
                   membersCount: serverEntity.membersCount ?? 0,
                   ageLimits: AgeLimit(rawValue: serverEntity.ageLimits ?? 0) ?? .none)
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

enum AgeLimit: Int {
    case none = 1
    case tineger = 2
    case adult = 3
    
    var description: String {
        switch self {
        case .none:
            return "Нет"
        case .tineger:
            return "16+"
        case .adult:
            return "18+"
        }
    }
}

