//
//  ExitViewModel.swift
//  VKProject
//
//  Created by Данила Парамин on 31.08.2022.
//

import Foundation
import Combine

final class ExitViewModel: ObservableObject {

    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        self.input = Input()
        self.output = Output()
        
        setUpBindings()
    }
}

private extension ExitViewModel{
    func setUpBindings(){
        bindExitButton()
    }
    
    func bindExitButton(){
        input.TapExit
            .sink {
                LocalStorage.current.isComplited = false
                AuthenticationLocalService.shared.status.send(false)
            }
            .store(in: &cancellable)
    }
}


extension ExitViewModel {
    
    struct Input {
        
        let TapExit = PassthroughSubject<Void, Never>()
        
    
    }
    
    struct Output {
        
    }
}

