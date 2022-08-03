//
//  SettingsListViewModel.swift
//  school
//
//  Created by Данила Парамин on 02.08.2022.
//

import Foundation
import Combine

final class SettingsListViewModel: ObservableObject {

    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        self.input = Input()
        self.output = Output()
        
        setUpBindings()
    }
}

private extension SettingsListViewModel{
    func setUpBindings(){
        bindEnterButton()
    }
    
    func bindEnterButton(){
        input.TapID
            .sink {id in
                print(id)
            }
            .store(in: &cancellable)
    }
}


extension SettingsListViewModel {
    
    struct Input {
        
        let TapID = PassthroughSubject<Int, Never>()
        
    
    }
    
    struct Output {
        
        var settings: [ButtonModel] = [
            .vk_mock1(),
            .vk_mock2(),
            .vk_mock3(),
            .vk_mock4(),
            .vk_mock5(),
            .vk_mock6(),
            .vk_mock7(),
            .vk_mock8(),
            .vk_mock9(),
            .vk_mock10(),
            .vk_mock11(),
            .vk_mock12(),
            .vk_mock13(),
            
        ]
        
    }
}
