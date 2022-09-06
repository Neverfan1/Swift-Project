//
//  WebView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct WebView: View {
    
    @State private var tagSelection: String? = nil
    
    @StateObject var viewModel = WebViewRepresentableModel()
    var body: some View {

            webView


    }
}



private extension WebView {
    @ViewBuilder var webView: some View{
        if let url = viewModel.url{
            WebViewRepresentable(url: url)
        
        }
    }
}

//
//Это токен: vk1.a.AOhevBLjA2xeHydZ5uUuSM0z6vE7cJGAsjd13qaqjuYRg2P8sVt_htNqVkIM0qsQqUNY7G8wRXawVQEfnxklLi4LsRyo6kebO6o8YjA_uIU8YPKOGu_QkY1aDq2EzZOMUq8dsFU_Iq9oxcgb4taHSoOmVufjlRPEAlUypgIVigzBMCbwI17PNohsgomAeUsD
//Это vkID:154032007
