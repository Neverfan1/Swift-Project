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
    
    private let api: GroupsListAPIProtocol
    
    private var offset = CurrentValueSubject<Int, Never>(0)
    
    private weak var router: GroupRouter?
    
    var input : Input
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(router: GroupRouter?,
         api:GroupsListAPIProtocol ) {
        self.api = api
        self.router = router
        self.input = Input()
        self.output = Output()
        
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
        sendModel()
        bindPagination()
        refresh()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getGroups(offset: offset.value)
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        
        request
            .values()
            .sink { [weak self] in
                self?.output.groups.append(contentsOf: $0)
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
    
    func sendModel() {
        input.model
            .sink { [weak self] in
                self?.router?.goToInfo(model: $0)
            }
            .store(in: &cancellable)
    }
    
    func bindPagination(){
        input.paginationAction
        .sink{ [weak self] in
            if let offsetCount = self?.offset.value{
                self?.offset.send(offsetCount + 10)
            }
            
        }
        .store(in: &cancellable)
    }
    
    func refresh(){
        input.refreshView
        .sink{ [weak self] in
                self?.offset.send(0)
        }
        .store(in: &cancellable)
    }
}

extension GroupListViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let model = PassthroughSubject<GroupModel, Never>()
        let paginationAction = PassthroughSubject<Void, Never>()
        let refreshView = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var groups: [GroupModel] = []
    }
}
