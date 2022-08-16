//
//  ContentView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tagSelection: String? = nil
    
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        if !viewModel.output.showFriends {
            webView
        } else {
//            NavigationView {
//                VStack {
//                  // ссылки на View с привязкой к teg'у
//                    NavigationLink(destination: GroupListView(), tag: "Groups", selection: $tagSelection) { EmptyView() }
//                    NavigationLink(destination: FriendsListView(), tag: "Friend", selection: $tagSelection) { EmptyView() }
//                    NavigationLink(destination: SettingsListView(), tag: "Settings", selection: $tagSelection) { EmptyView() }
//
//                    Button {
//                      // сообщаем объявленному свойству значение teg'а
//                      // на основании которого будет активированн та или
//                      // иная ссылка
//                        tagSelection = "Groups"
//                    } label: {
//                        Text("Показать группы")
//                    }
//
//                    Button {
//                        tagSelection = "Friend"
//                    } label: {
//                        Text("Показать друзей")
//                    }
//
//                    Button {
//                        tagSelection = "Settings"
//                    } label: {
//                        Text("Настройки (надо переделать)")
//                    }
//                }
//                .navigationTitle("Главный экран")
//            }
//        }
            
                TabView{
                    GroupListView()
                        .tabItem {
                                Image(systemName: "person.3")
                                Text("Группы")
                        }
                    FriendsListView()
                            .tabItem {
                                    Image(systemName: "person.2")
                                    Text("Друзья")
                            }
                    SettingsListView()
                                .tabItem {
                                        Image(systemName: "gear")
                                        Text("Настройки")
                                }
                    AlbumListView()
                                .tabItem {
                                        Image(systemName: "photo.on.rectangle")
                                        Text("Фотоальбомы")
                                }
                    PhotoListView()
                                .tabItem {
                                        Image(systemName: "photo")
                                        Text("Фото")
                                }

                }
        }
    }
}



private extension ContentView {
    @ViewBuilder var webView: some View{
        if let url = viewModel.url{
            WebViewRepresentable(url: url,
                                 onComplited: viewModel.input.onComplitedWebView)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

