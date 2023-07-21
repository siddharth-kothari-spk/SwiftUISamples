//
//  ContentView.swift
//  UIViewRepresentable
//
//  Created by Siddharth Kothari on 04/07/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        VStack {
            WebView(url: "https://www.apple.com")
        }
      
    }
}

struct WebView: UIViewRepresentable {
    let url: String
    
    func makeWebView() -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: URL(string: url)!))
        return webView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

