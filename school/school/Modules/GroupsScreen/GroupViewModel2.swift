//
//  GroupViewModel2.swift
//  school
//
//  Created by Данила Парамин on 09.08.2022.
//

import Foundation
import Combine

final class GroupViewModel2: ObservableObject {

    let apiService = VKAPIService()

    let input = Input()
    @Published var output = Output()

    private var cancellable = Set<AnyCancellable>()

    init() {
        setubBindings()
    }

    func setubBindings() {
        bindRequest()
    }

    func bindRequest() {

        input.onAppear
            .map { [unowned self] in
                self.apiService.getGroups()
            }
            .switchToLatest()
            .sink { error in
                print(error)
            } receiveValue: { groups in
                print(groups)
            }
            .store(in: &cancellable)


    }


}

extension GroupViewModel2 {

    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }

    struct Output {
        var groupList : [groupModel] = []

    }
}
