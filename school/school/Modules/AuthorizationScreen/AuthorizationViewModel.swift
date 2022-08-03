//
//  AuthorizationViewModel.swift
//  school
//
//  Created by Данила Парамин on 21.07.2022.
//

import Foundation
import Combine

final class AuthorizationViewModel: ObservableObject {

    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        self.input = Input()
        self.output = Output()
        
        setUpBindings()
    }
    
    
    
    
//    var count = 1
//
//    @Published var Output = true
//    {
//        didSet{
//            count += 1
//            trigger2.send(count)
//        }
//    }
    
//    var isDisabled = true{
//        didSet{
//            print("old Value \(oldValue)")
//        }
//        willSet{
//            print("new Value" + String(newValue))
//
//        }
//    }
    
//    var isDisabled = true{
//        didSet{
//            self.objectWillChange.send()
//        }
//
//    }
    
    
//    let trigger = PassthroughSubject<Int, Never>()
//    let trigger2 = CurrentValueSubject<Int, Never>(1)
//
//    var cancellable = Set<AnyCancellable>()
//
//    init(){
//        trigger2
//            .sink { number in
//                print(number)
//            }
//            .store(in: &cancellable)
//    }
    
}

private extension AuthorizationViewModel{
    func setUpBindings(){
        bindEnterButton()
    }
    
    func bindEnterButton(){
        input.enterButtonTap
            .sink {[weak self] in
                self?.output.title = "New title"
            }
            .store(in: &cancellable)
    }
}


extension AuthorizationViewModel {
    
    struct Input {
        
        let enterButtonTap = PassthroughSubject<Void, Never>()
        
    
    }
    
    struct Output {
        
        var title: String = "Вход в VK ID"
        
    }
}
