//
//  AlbumListViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import Foundation
import Combine

final class AlbumListViewModel: ObservableObject {
    
//    private let apiService = VKAPIService()
    private let api: AlbumListAPIProtocol
    
    private weak var router: AlbumsRouter?
    
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init(router: AlbumsRouter?,
         api: AlbumListAPIProtocol) {
        self.api = api
        self.router = router
        self.input = Input()
        self.output = Output()
        
        setubBindings()
    }
    
    func setubBindings() {
        bindAlbumButtonTap()
        bindRequest()
        
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getAlbums()
                    .materialize()
                
                
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.album = $0
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
    
    func bindAlbumButtonTap() {
        
        input.goToPhoto.sink { [weak self] in
            self?.router?.goToPhoto(id: $0)
        }
        .store(in: &cancellable)
    }
    
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let goToPhoto = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        var album: [AlbumModel] = []
        
    }
}

