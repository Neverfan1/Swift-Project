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
             \TabBarCoordinator.settings,
             
        ]
    )
    
    @Route(tabItem: makeGroupsTab) var groups = makeGroups
    @Route(tabItem: makePhotosTab) var photos = makePhotos
    @Route(tabItem: makeFriendsTab) var friends = makeFriends
    @Route(tabItem: makeSettingsTab) var settings = makeSettings
    
    deinit {
        print("Deinit AuthenticatedCoordinator")
    }
}

extension TabBarCoordinator {
    
    @ViewBuilder func makeGroups() -> some View {
        let viewModel = GroupListViewModel()
        GroupListView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeGroupsTab(isActive: Bool) -> some View {
        Image(systemName: "person.3")
        Text("Groups")
    }
    
    func makePhotos() -> PhotosCoordinator {
        PhotosCoordinator()
    }

    
    @ViewBuilder func makePhotosTab(isActive: Bool) -> some View {
        Image(systemName: "photo.on.rectangle")
        Text("albums")
    }
    
    @ViewBuilder func makeFriends()  -> some View {
        let viewModel = FriendListViewModel()
        FriendsListView(viewModel2: viewModel)
    }
    
    @ViewBuilder func makeFriendsTab(isActive: Bool) -> some View {
        Image(systemName: "person.2")
        Text("friends")
    }
    
    @ViewBuilder func makeSettings() -> some View {
        SettingsListView()
    }
    
    @ViewBuilder func makeSettingsTab(isActive: Bool) -> some View {
        Image(systemName: "gear")
        Text("Settings")
    }
    
    
}


