//
//  FriendsCoordinator.swift
//  VKProject
//
//  Created by Данила Парамин on 24.08.2022.
//

import Foundation
import SwiftUI
import Stinsen

final class FriendsCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \FriendsCoordinator.start)
    
    @Root var start = makeFriends
    
    @Route(.push) var user = makeUser
    
        
#if DEBUG
    deinit {
        print("Coordinator \(self) DEINITED!!!")
    }
#endif
}

extension FriendsCoordinator {
    
    @ViewBuilder func makeFriends() -> some View {
        let viewModel = FriendListViewModel(router: self)
        FriendsListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeUser(id: Int) -> some View {
        let viewModel = UserViewModel(userID: id)
        UserView(viewModel: viewModel)
    }
}
