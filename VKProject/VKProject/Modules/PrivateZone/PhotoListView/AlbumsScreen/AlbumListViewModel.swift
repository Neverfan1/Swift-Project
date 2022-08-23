//
//  AlbumListViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

//import Foundation
//import Combine
//import CombineExt
//
//final class AlbumListViewModel: ObservableObject {
//    
//    let apiService = VKAPIService()
//    
//    let input = Input()
//    @Published var output = Output()
//    
//    private var cancellable = Set<AnyCancellable>()
//    
//    init() {
//        
//        setubBindings()
//    }
//    
//    func setubBindings() {
//        bindRequest()
//    }
//    
//    func bindRequest() {
//        
//        let request = input.onAppear
//            .map { [unowned self] in
//                self.apiService.getAlbums()
//                    .materialize()
//
//                
//            }
//            .switchToLatest()
//            .share()
//        
//        request
//            .values()
//            .sink { [weak self] in
//                self?.output.album = $0
//            }
//            .store(in: &cancellable)
//        
//        request
//            .failures()
//            .sink { [weak self] in
////                LocalStorage.current.token = nil
////                self?.output.error = true
//                switch $0 {
//                case .badQuery: print("badQuery")
//                case .notFound: print("notFound")
//                }
//            }
//            .store(in: &cancellable)
//    
//    }
//    
//}
//
//extension AlbumListViewModel {
//    
//    struct Input {
//        let onAppear = PassthroughSubject<Void, Never>()
//    }
//    
//    struct Output {
//        var album: [AlbumModel] = []
//        var error = false
//    }
//}
//

import Foundation
import Combine

final class AlbumListViewModel: ObservableObject {
    
    let apiService = VKAPIService()
    
    private weak var router: AlbumsRouter?
    
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init(router: AlbumsRouter?) {
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
                self.apiService.getAlbums()
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
        var error = false
        
    }
}

