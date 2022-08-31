//
//  UserModelMapper.swift
//  VKProject
//
//  Created by Данила Парамин on 24.08.2022.
//

import Foundation

final class UserModelMapper: BaseModelMapper<ServerUserModel, UserModel> {
    
    override func toLocal(serverEntity: ServerUserModel) -> UserModel {
        
        UserModel(id: serverEntity.id ?? 0,
                  bdate: serverEntity.bdate.orEmpty,
                  country: serverEntity.city?.title ?? "",
                  city: serverEntity.city?.title ?? "",
                  photoMaxOrig: serverEntity.photoMaxOrig.orEmpty,
                  about: serverEntity.about.orEmpty,
                  activities: serverEntity.activities.orEmpty,
                  followersCount: serverEntity.followersCount ?? 0,
                  universityName: serverEntity.universityName.orEmpty,
                  university: serverEntity.university ?? 0,
                  faculty: serverEntity.faculty ?? 0,
                  facultyName: serverEntity.facultyName.orEmpty,
                  graduation: serverEntity.graduation ?? 0,
                  albums: serverEntity.counters[Consts.UserCounters.albums] ?? 0,
                  audios: serverEntity.counters[Consts.UserCounters.audios] ?? 0,
                  followers: serverEntity.counters[Consts.UserCounters.followers] ?? 0,
                  friends: serverEntity.counters[Consts.UserCounters.friends] ?? 0,
                  onlineFriends: serverEntity.counters[Consts.UserCounters.onlineFriends] ?? 0,
                  pages: serverEntity.counters[Consts.UserCounters.pages] ?? 0,
                  photos: serverEntity.counters[Consts.UserCounters.photos] ?? 0,
                  videos: serverEntity.counters[Consts.UserCounters.videos] ?? 0,
                  mutualFriends: serverEntity.counters[Consts.UserCounters.mutualFriends] ?? 0,
                  firstName: serverEntity.firstName.orEmpty,
                  lastName: serverEntity.lastName.orEmpty,
                  screenName: serverEntity.screenName.orEmpty,
                  status: serverEntity.status.orEmpty,
                  online: serverEntity.online ?? 0,
                  onlineMobile: serverEntity.onlineMobile ?? 0,
                  canAccessClosed: serverEntity.canAccessClosed ?? false,
                  isClosed: serverEntity.isClosed ?? false
        )
        
    }
}
