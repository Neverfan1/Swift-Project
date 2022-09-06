//
//  UserViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 24.08.2022.
//

import Foundation
import Combine
import CombineExt

final class UserViewModel: ObservableObject {
    
//    let apiService = VKAPIService()
    private let api: UserAPIProtocol
    
    private let userID: Int

    
    let input : Input
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(userID: Int,
         api: UserAPIProtocol) {
        self.api = api
        self.userID = userID
        self.input = Input()
        self.output = Output()
        
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
//        sendModel()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getUser(id: self.userID)
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.user = $0
                
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

extension UserViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()

    }
    
    struct Output {
        var user: UserModel?
    }
    
}

