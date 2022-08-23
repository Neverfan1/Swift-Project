//
//  LoginVKViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//

import Foundation
import Combine

final class LoginVKViewModel: ObservableObject {
    
    let input: Input
    @Published var output: Output
    
    private weak var router: LoginVKRouter?
    private var cancellable = Set<AnyCancellable>()
    
    init(router: LoginVKRouter?) {
        self.router = router
        self.input = Input()
        self.output = Output()
        
        bind()
    }
    
    func bind() {
        bindAuthButtonTap()
    }
    
    
    func bindAuthButtonTap() {
        input.authButtonTap.sink { [weak self] in
            self?.router?.goToWebView()
        }
        .store(in: &cancellable)
    }
    
    
    struct Input {
        let authButtonTap = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var isDisabled = true
    }
}

