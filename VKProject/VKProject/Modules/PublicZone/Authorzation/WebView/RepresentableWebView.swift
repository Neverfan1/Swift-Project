//
//  RepresentableWebView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Combine
import WebKit
import SwiftUI

struct WebViewRepresentable: UIViewRepresentable {
    
    let url: URL
    let onComplited: PassthroughSubject<Void, Never>
    
    func makeUIView(context: Context) -> some WKWebView {
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
        return Coordinator(onComplited: onComplited)
    }
    
    final class Coordinator: NSObject, WKNavigationDelegate {
        
        let onComplited: PassthroughSubject<Void, Never>
        
        init(onComplited: PassthroughSubject<Void, Never>) {
            self.onComplited = onComplited
        }
        
        func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!){
            guard let param = webView.url?.queryParams else { return }
            guard let authorizeUrlString = param["authorize_url"] else { return }
            guard let authorizeURL = URL(string: authorizeUrlString) else { return }
            guard let pathComponents = authorizeURL.pathComponents.last else { return }
            
            let components = pathComponents.components(separatedBy: "&")
            
            components.forEach{ component in
                if component.contains("access_token"){
                    let tokenComponent = component.components(separatedBy: "=")
                    if let token = tokenComponent.last {
                        LocalStorage.current.token = token
                        print("Это токен: \(token)")
                    }
                } else if component.contains("expires_in"){
                    let expiresInComponent = component.components(separatedBy: "=")
                    if let expiresIn = expiresInComponent.last {
                        LocalStorage.current.expiresIn = expiresIn
                    }
                } else if component.contains("user_id"){
                    let userIdComponent = component.components(separatedBy: "=")
                    if let userId = userIdComponent.last {
                        if let vkId = Int(userId){
                            LocalStorage.current.vkId = vkId
                            print("Это vkID:\(vkId)")
                        }
                    }
                }
                onComplited.send()
            }
        }
    }
}

extension URL {
    public var queryParams: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
                
    }
}

