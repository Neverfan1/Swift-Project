//
//  GroupListViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Combine
import CombineExt

final class GroupListViewModel: ObservableObject {
    
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
                self.apiService.getGroups()
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.groups = $0
            }
            .store(in: &cancellable)
        
        request
            .failures()
            .sink { [weak self] in
//                LocalStorage.current.token = nil
//                self?.output.error = true
                switch $0 {
                case .badQuery: print("badQuery")
                case .notFound: print("notFound")
                }
            }
            .store(in: &cancellable)
    
    }
    
}

extension GroupListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var groups: [GroupModel] = []
        var error = false
    }
}
