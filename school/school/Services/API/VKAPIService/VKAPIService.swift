//
//  VKAPIService.swift
//  school
//
//  Created by Данила Парамин on 09.08.2022.
//


import Foundation
import Moya
import Combine
import CombineMoya

struct VKAPIService {
    let provider = Provider<VKAPI>()
}



extension VKAPIService {
    
    func getGroups() -> AnyPublisher<[ServerGroup], APIError> {
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map([ServerGroup].self)
            .mapError({ _ in
                    .bad
            })
            .eraseToAnyPublisher()
    }
    
}
