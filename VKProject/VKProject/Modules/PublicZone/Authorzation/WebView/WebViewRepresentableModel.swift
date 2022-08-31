//
//  ContentViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import Combine

final class WebViewRepresentableModel: ObservableObject {
    
    let input = Input()
    @Published var output = Output()
    private weak var router: WebRouter?
    var cancellable = Set<AnyCancellable>()
    
    init(router: WebRouter?) {
        bind()
        self.router = router
        complited()
    }
    
    func bind(){
        input.onComplitedWebView
            .sink{ [weak self] in
                self?.output.showContent = true
                
            }
            .store(in: &cancellable)
    }
    
    func complited (){
        LocalStorage.current.isComplited = true
        AuthenticationLocalService.shared.status.send(true)
    }
    
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
    
   
}

extension WebViewRepresentableModel{
    
    struct Input {
        let onComplitedWebView = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var showContent = LocalStorage.current.isComplited != false 
        
        
    }
}

