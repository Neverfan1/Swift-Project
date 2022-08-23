//
//  GroupsCoordinator.swift
//  VKProject
//
//  Created by Данила Парамин on 21.08.2022.
//


import Foundation
import SwiftUI
import Stinsen

final class GroupsCoordinator: NavigationCoordinatable {

    let stack = NavigationStack(initial: \GroupsCoordinator.start)

    @Root var start = makeGroups

    @Route(.push) var groupInfo = makeGroupInfo

#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension GroupsCoordinator {

    @ViewBuilder func makeGroups() -> some View {
        let viewModel = GroupListViewModel(router: self)
        GroupListView(viewModel: viewModel)
    }

    @ViewBuilder func makeGroupInfo() -> some View {
        GroupInfoView()

        let viewModel = PhotoListViewModel(albumID: id)
        GroupInfoView(viewModel: viewModel)
    }
}


