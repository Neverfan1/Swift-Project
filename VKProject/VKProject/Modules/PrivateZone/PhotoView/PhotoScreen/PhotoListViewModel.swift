//
//  PhotoListViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//


import Foundation
import Combine
import CombineExt

final class PhotoListViewModel: ObservableObject {
    
    private let api: PhotoListAPIProtocol
    
    private var offset = CurrentValueSubject<Int, Never>(0)
    
    private let albumID: Int
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(albumID: Int,
         api: PhotoListAPIProtocol) {
        self.api = api
        self.albumID = albumID
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
        bindPagination()
        refresh()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getPhoto(id: self.albumID, offset: offset.value)
                    .materialize()
                
                
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.photo.append(contentsOf: $0)
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

extension PhotoListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let paginationAction = PassthroughSubject<Void, Never>()
        let refreshView = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var photo: [PhotoModel] = []
    }
}

