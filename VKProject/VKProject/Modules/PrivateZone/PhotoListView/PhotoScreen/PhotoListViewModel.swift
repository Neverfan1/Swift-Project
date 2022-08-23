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
    
    let apiService = VKAPIService()
    
    private let albumID: Int
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(albumID: Int) {
        self.albumID = albumID
        setubBindings()
    }
    
    func setubBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.apiService.getPhoto(id: self.albumID)
                    .materialize()

                
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.photo = $0
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

extension PhotoListViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var photo: [PhotoModel] = []
        var error = false
    }
}

