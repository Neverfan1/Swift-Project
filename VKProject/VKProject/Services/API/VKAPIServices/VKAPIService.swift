//
//  VKAPIService.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct VKAPIService {
    let provider = Provider<VKAPI>()
}

extension VKAPIService {
    
    func getFriends() -> AnyPublisher<[FriendModel], APIError> {
        provider.requestPublisher(.getFriends)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse1.self)
            .map { $0.response.items }
            .map { FriendModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .badQuery
            })
            .eraseToAnyPublisher()
    }
    
    func getGroups() -> AnyPublisher<[GroupModel], APIError> {
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map(ServerResponse2.self)
            .map { $0.response.items }
            .map { GroupModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .badQuery
            })
            .eraseToAnyPublisher()
    }
    
}

