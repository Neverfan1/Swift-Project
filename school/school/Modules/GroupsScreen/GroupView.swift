//
//  GroupView.swift
//  school
//
//  Created by Данила Парамин on 09.08.2022.
//

import SwiftUI


struct GroupView: View {

    @StateObject var viewModel = GroupViewModel2()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: onApperSend)
    }

    func onApperSend() {
        viewModel.input.onAppear.send()
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}

//struct GroupView: View {
//
//    @StateObject var viewModel = GroupViewModel()
//
//    var body: some View {
//
//            webView
//
//    }
//}
//
//private extension GroupView {
//
//    @ViewBuilder var webView: some View {
//        if let url = viewModel.url {
//            WebViewRepresentable(url: url)
//        }
//    }
//}
//
//private extension GroupView {
//
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupView()
//    }
//}
