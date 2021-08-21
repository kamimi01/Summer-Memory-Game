//
//  WebView.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(loadUrl: "")
    }
}
