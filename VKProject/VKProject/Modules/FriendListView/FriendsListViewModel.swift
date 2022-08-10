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
    
    let apiService = VKAPIService()
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.apiService.getFriends()
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
    
}

extension FriendListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var friends: [FriendModel] = []
    }
}
