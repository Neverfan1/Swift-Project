//
//  ContentViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    
    var url: URL? {
        guard var urlComponents = URLComponents(string: Consts.VK.vkURL) else {
            return nil
        }
        
        let items = [
            URLQueryItem(name: Consts.VK.clientIDKey, value: Consts.VK.clientIDValue),
            //URLQueryItem(name: Consts.VK.redirectUriKey, value: Consts.VK.redirectUriValue),
            URLQueryItem(name: Consts.VK.scopeKey, value: Consts.VK.scopeValue),
            URLQueryItem(name: Consts.VK.displayKey, value: Consts.VK.displayValue),
            URLQueryItem(name: Consts.VK.responseTypeKey, value: Consts.VK.responseTypeValue)
        ]
        
        urlComponents.queryItems = items
        
        return urlComponents.url
    }
    
    var token = LocalStorage.current.token
    
    let input = Input()
    @Published var output = Output()
    
    var cancellable = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    func bind() {
        input.onComplitedWebView
            .sink { [weak self] in
                self?.output.showFriends = true
            }
            .store(in: &cancellable)
    }
}

extension ContentViewModel {
    
    struct Input {
        let onComplitedWebView = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var showFriends = LocalStorage.current.token != nil
    }
}

