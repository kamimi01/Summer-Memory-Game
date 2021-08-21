//
//  AboutThisApp.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/18.
//

import SwiftUI

struct AboutThisAppView: View {
    var body: some View {
        WebView(loadUrl: "https://kamimi01.github.io/Summer-Memory-Game/privacy_policy/ja.html")
    }
}

struct AboutThisAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutThisAppView()
    }
}
