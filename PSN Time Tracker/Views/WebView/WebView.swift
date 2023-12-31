//
//  WebView.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 12/11/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @AppStorage("ssoToken") var ssoToken: String = ""
    var webView: WKWebView
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    init() {
        self.webView = WKWebView()
    }
    
    
    func makeUIView(context: Context) -> WKWebView {
        context.coordinator.addProgressObserver()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: URL(string: "https://store.playstation.com")!)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
       
    }
    
    static func dismantleUIView(_ uiView: WKWebView, coordinator: Coordinator) {
        coordinator.removeProgressObserver()
        uiView.navigationDelegate = nil
    }
    
    
    
    
}

extension WebView {
    class Coordinator: NSObject, WKNavigationDelegate {
        
        
        private let parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
        
        deinit {
            parent.webView.navigationDelegate = nil
        }
        
        func removeProgressObserver() {
            parent.webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
        }
        
        func addProgressObserver() {
            parent.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
            
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let url = parent.webView.url?.absoluteString;
            guard url != nil else {return}
            if (url!.starts(with: "https://store.playstation.com")) {
                parent.webView.evaluateJavaScript("document.cookie", completionHandler: {
                    value, error in
                    guard error == nil else {return}
                    if (!String(describing: value!).contains("isSignedIn=true;")) {
                        self.parent.webView.evaluateJavaScript("document.querySelector(\"[data-qa='web-toolbar#signin-button']\").click()")
                    }
                })
            }
            print(url)
            if (url!.contains("ssocookie")) {
                parent.webView.evaluateJavaScript("document.body.innerText", completionHandler: {
                    value, error in
                    guard error == nil else {return}
                    let decoder = JSONDecoder()
                    do {
                        print(value)
                        var decoded = try decoder.decode(TokenData.self, from: String(describing: value!).data(using: .utf8)!)
                        
                        self.parent.ssoToken = decoded.npsso
                    } catch {
                        print("Unable to get token")
                    }
                })
            }
            print("Page fully loaded")
            
        }
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if let o = object as? WKWebView, o == parent.webView {
                   if keyPath == #keyPath(WKWebView.estimatedProgress) {
                       let url = parent.webView.url?.absoluteString;
                       if ((url?.starts(with: "https://store.playstation.com")) != nil) {
                           parent.webView.evaluateJavaScript("document.cookie", completionHandler: {
                               value, error in
                               guard error == nil else {return}
                               if (String(describing: value!).contains("isSignedIn=true;")) {
                                   let request = URLRequest(url: URL(string: "https://ca.account.sony.com/api/v1/ssocookie")!)
                                   self.parent.webView.load(request)
                               }
                           })
                       }
                       
                   }
               }
           }
    }
}

struct TokenData: Codable {
    var npsso: String
}
