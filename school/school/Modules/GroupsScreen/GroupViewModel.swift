//
//  GroupViewModel.swift
//  school
//
//  Created by Данила Парамин on 09.08.2022.
//

//import Foundation
//import Combine
//
//final class GroupViewModel: ObservableObject {
//
//    let apiService = VKAPIService()
//
//    let input = Input()
//    @Published var output = Output()
//
//    private var cancellable = Set<AnyCancellable>()
//
//    init() {
//        setubBindings()
//    }
//
//    func setubBindings() {
//        bindRequest()
//    }
//
//    func bindRequest() {
//
//        input.onAppear
//            .map { [unowned self] in
//                self.apiService.getGroups()
//            }
//            .switchToLatest()
//            .sink { error in
//                print(error)
//            } receiveValue: { groups in
//                print(groups)
//            }
//            .store(in: &cancellable)
//
//
//    }
//
//
//}
//
//extension GroupViewModel {
//
//    struct Input {
//        let onAppear = PassthroughSubject<Void, Never>()
//    }
//
//    struct Output {
//
//    }
//}


import Foundation

final class GroupViewModel: ObservableObject {
    
    let storage = LocalStorage.current
    
    var url: URL? {
        guard var urlComps = URLComponents(string: Consts.VKGroup.vkURL) else {
            return nil
        }
        
        let items = [
            URLQueryItem(name: Consts.VKGroup.userIDKey, value: Consts.VKGroup.userIDValue),
            URLQueryItem(name: Consts.VKGroup.extendedKey, value: Consts.VKGroup.extendedValue),
            URLQueryItem(name: Consts.VKGroup.countKey, value: Consts.VKGroup.countValue),
            URLQueryItem(name: Consts.VKGroup.accessTokenKey, value: storage.getToken()),
            URLQueryItem(name: Consts.VKGroup.versionKey, value: Consts.VKGroup.versionValue)
        ]
        urlComps.queryItems = items
        return urlComps.url
    }
    
    
}
