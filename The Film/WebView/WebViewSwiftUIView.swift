//
//  WebViewSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 13/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import WebKit
struct WebViewSwiftUIView: View {
    @Environment(\.presentationMode) var presentation
    let webview = Webview(web: nil, req: URLRequest(url: URL(string: "https://www.youtube.com/watch?v=P6AaSMfXHbA")!))

    var body: some View {
        ZStack {
            webview
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
}

struct WebViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewSwiftUIView()
    }
}




struct Webview : UIViewRepresentable {
    let request: URLRequest
    var webview: WKWebView?

    init(web: WKWebView?, req: URLRequest) {
        self.webview = WKWebView()
        self.request = req
    }

    func makeUIView(context: Context) -> WKWebView  {
        return webview!
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }

 
  }
