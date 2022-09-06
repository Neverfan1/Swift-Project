//
//  FriendListViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Combine
import CombineExt

final class FriendListViewModel: ObservableObject {
    
    private let api: FriendsListAPIProtocol
    
    private weak var router: FriendsRouter?
    
    let input: Input
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(router: FriendsRouter?,
         api: FriendsListAPIProtocol) {
        self.api = api
        self.router = router
        self.input = Input()
        self.output = Output()
        
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
        bindFriendsButtonTap()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getFriends()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.friends = $0
            }
            .store(in: &cancellable)
        
        request
            .failures()
            .sink {
                switch $0 {
                case .badQuery: print("badQuery")
                case .notFound: print("notFound")
                }
            }
            .store(in: &cancellable)
        
    }
    
    
    func bindFriendsButtonTap() {
        
        input.goToUser.sink { [weak self] in
            self?.router?.goToUser(id: $0)
        }
        .store(in: &cancellable)
    }
}

extension FriendListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let goToUser = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        var friends: [FriendModel] = []
    }
}
