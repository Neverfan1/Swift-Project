//
//  TabBarCoordinator.swift
//  VKProject
//
//  Created by Данила Парамин on 20.08.2022.
//

import Foundation
import SwiftUI
import Stinsen
import Combine

final class TabBarCoordinator: TabCoordinatable {
    var child = TabChild(
        startingItems: [
            \TabBarCoordinator.groups,
             \TabBarCoordinator.photos,
             \TabBarCoordinator.friends,
             \TabBarCoordinator.exit,
             
        ]
    )
    
    @Route(tabItem: makeGroupsTab) var groups = makeGroups
    @Route(tabItem: makePhotosTab) var photos = makePhotos
    @Route(tabItem: makeFriendsTab) var friends = makeFriends
    @Route(tabItem: makeExitTab) var exit = makeExit
    
    deinit {
        print("Deinit AuthenticatedCoordinator")
    }
}

extension TabBarCoordinator {
    
    func makeGroups() -> NavigationViewCoordinator<GroupsCoordinator> {
        NavigationViewCoordinator(GroupsCoordinator())
    }
    
    @ViewBuilder func makeGroupsTab(isActive: Bool) -> some View {
        Image(systemName: "person.3")
        Text(Strings.groups)
    }
    
    func makePhotos() -> NavigationViewCoordinator<PhotosCoordinator> {
        NavigationViewCoordinator(PhotosCoordinator())
    }

    
    @ViewBuilder func makePhotosTab(isActive: Bool) -> some View {
        Image(systemName: "photo.on.rectangle")
        Text(Strings.album)
    }
    
    func makeFriends()  -> NavigationViewCoordinator<FriendsCoordinator> {
        NavigationViewCoordinator(FriendsCoordinator())
    }

    
    @ViewBuilder func makeFriendsTab(isActive: Bool) -> some View {
        Image(systemName: "person.2")
        Text(Strings.friends)
    }
    
    @ViewBuilder func makeExit() -> some View {
        ExitView(viewModel: ExitViewModel())
    }
    
    @ViewBuilder func makeExitTab(isActive: Bool) -> some View {
        Image(systemName: "rectangle.portrait.and.arrow.right")
        Text(Strings.exit)
    }
    
    
}


