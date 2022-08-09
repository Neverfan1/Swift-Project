//
//  RepresentableWebView.swift
//  school
//
//  Created by Данила Парамин on 08.08.2022.
//

import WebKit
import SwiftUI

struct WebViewRepresentable: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        DispatchQueue.main.async {
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    final class Coordinator: NSObject, WKNavigationDelegate {
        
        func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
            print(webView.url)
            guard let param = webView.url?.queryParameters else { return }
            guard let authorizeUrlString = param["authorize_url"] else { return }
            guard let authorizeURL = URL(string: authorizeUrlString) else { return }
            guard let patchComponent = authorizeURL.pathComponents.last else { return }
            
            let components = patchComponent.components(separatedBy: "&")
            
            components.forEach { component in
                if component.contains("access_token") {
                    let tokenComponents = component.components(separatedBy: "=")
                    if let token = tokenComponents.last {
                        LocalStorage.current.setToken(token: token)
                        print("Это токен \(token)")
                    }
                } else if component.contains("expires_in") {
                    let expiresInComponents = component.components(separatedBy: "=")
                    if let expiresIn = expiresInComponents.last {
                        print(expiresIn)
                    }
                } else if component.contains("user_id") {
                    let userIDComponents = component.components(separatedBy: "=")
                    if let userID = userIDComponents.last {
                        
                        if let vkID = Int(userID) {
                            LocalStorage.current.vkID = vkID
                        }
                        
                        print("Это vkID \(userID)" )
                    }
                }
            }
        }
    }
}

extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
