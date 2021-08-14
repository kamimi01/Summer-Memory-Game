//
//  GamePlayResult.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/14.
//

import SwiftUI

struct GamePlayResult: View {
    @State private var isShowing = false
    var body: some View {
        VStack(spacing:20){
            Text("Nanakoさん\n勝利！").font(.system(size: 50, weight:.bold, design:.default))
                .padding(.vertical,130)
                .multilineTextAlignment(.center)
            
            Button("罰ゲーム"){
                isShowing = true
            }.sheet(isPresented: $isShowing, content: {
                ModalView()
            })
            .frame(width: 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .accentColor(.white)
            .background(Color.blue)
            .cornerRadius(26)
            .padding()
            
            
            Button("スタート画面に戻る"){
            }
            .frame(width: 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .accentColor(.white)
            .background(Color.blue)
            .cornerRadius(26)
            .padding()
        }
    }
}

struct GamePlayResult_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayResult()
    }
}

struct ModalView: View {
    var body: some View {
        let randomInt = Int.random(in: 1..<3)
        let imageName = "horror"+String(randomInt)
        Image(imageName).resizable()
    }
}
