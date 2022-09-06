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
            .map(ServerListResponse<ServerFriendModel>.self)
            .map { $0.response.items }
            .map { FriendModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getGroups() -> AnyPublisher<[GroupModel], APIError> {
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<ServerGroupModel>.self)
            .map { $0.response.items }
            .map { GroupModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getPhoto(id: Int) -> AnyPublisher<[PhotoModel], APIError> {
        provider.requestPublisher(.getPhoto(id: id))
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<ServerPhotoModel>.self)
            .map { $0.response.items }
            .map { PhotoModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAlbums() -> AnyPublisher<[AlbumModel], APIError> {
        provider.requestPublisher(.getAlbums)
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<ServerAlbumModel>.self)
            .map { $0.response.items }
            .map { AlbumModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getUser(id: Int) -> AnyPublisher<UserModel, APIError> {
        provider.requestPublisher(.getUser(userID: id))
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<ServerUserModel>.self)
            .map { $0.response }
            .map { UserModelMapper().toLocal(list: $0).first! }
            .mapError({ error in
                print(error)

                    return .badQuery
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

extension VKAPIService: AlbumListAPIProtocol, PhotoListAPIProtocol, UserAPIProtocol, FriendsListAPIProtocol, GroupsListAPIProtocol {}


protocol AlbumListAPIProtocol {
    func getAlbums() -> AnyPublisher<[AlbumModel], APIError>
}

protocol PhotoListAPIProtocol {
    func getPhoto(id: Int) -> AnyPublisher<[PhotoModel], APIError>
}

protocol UserAPIProtocol {
    func getUser(id: Int) -> AnyPublisher<UserModel, APIError>
}

protocol FriendsListAPIProtocol {
    func getFriends() -> AnyPublisher<[FriendModel], APIError>
}

protocol GroupsListAPIProtocol {
    func getGroups() -> AnyPublisher<[GroupModel], APIError>
}

