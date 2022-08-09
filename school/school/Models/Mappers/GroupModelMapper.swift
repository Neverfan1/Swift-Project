//
//  GroupModelMapper.swift
//  school
//
//  Created by Данила Парамин on 09.08.2022.
//


import Foundation
import SwiftUI

final class GroupModelMapper: BaseModelMapper<ServerGroup, groupModel> {
    
    override func toLocal(serverEntity: ServerGroup) -> groupModel {
        groupModel(id: serverEntity.id ,
                   name: serverEntity.name ,
                   screen_name: serverEntity.screen_name ,
                   is_closed: serverEntity.is_closed ,
                   type: serverEntity.type ,
                   photo_100: serverEntity.photo_100 )
    }
}


