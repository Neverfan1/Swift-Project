//
//  UserModelMapper.swift
//  school
//
//  Created by Данила Парамин on 28.07.2022.
//

import Foundation
import SwiftUI

final class UserModelMapper: BaseModelMapper<ServerUser, User> {
    
    override func toLocal(serverEntity: ServerUser) -> User {
        User(firsName: serverEntity.firstName ?? "",
             seconName: serverEntity.secondName ?? "",
             sex: UserSex(rawValue: serverEntity.sex) ?? .boy,
             age: serverEntity.age ?? -1,
             color: .blue,
             numberPhone: "123",
             photo: Image(systemName: "chevron.right"))
    }
}
