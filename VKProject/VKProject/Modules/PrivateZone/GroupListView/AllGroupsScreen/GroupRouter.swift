//
//  GroupRouter.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//

import Foundation

protocol GroupRouter: AnyObject {
    func goToInfo(model: GroupModel)
}

extension GroupsCoordinator: GroupRouter {
    func goToInfo(model: GroupModel) {
        self.route(to: \.groupInfo , model)
    }
}
