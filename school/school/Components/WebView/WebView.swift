//
//  WebView.swift
//  school
//
//  Created by Данила Парамин on 08.08.2022.
//

import SwiftUI

struct WebView: View {
    
    @StateObject var viewModel = URLComp()
    
    var body: some View {
//        if viewModel.token == nil {
        
            webView
//        } else {
//            
//            SettingsListView()
//
//        }
    }
}

private extension WebView {
    
    @ViewBuilder var webView: some View {
        if let url = viewModel.url {
            WebViewRepresentable(url: url)
        }
    }
}

private extension WebView {
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
