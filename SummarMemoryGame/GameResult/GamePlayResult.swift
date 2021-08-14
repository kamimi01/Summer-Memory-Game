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
        
        NavigationView{
            VStack(spacing:0){
                
                Image("background2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                
                Text("先攻の方の\n勝利！").font(.system(size: 50, weight:.bold, design:.default))
                    .frame(width: 300, height: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                
                Button("罰ゲーム"){
                    isShowing = true
                }.sheet(isPresented: $isShowing, content: {
                    ModalView()
                })
                .frame(width: 250, height: 60, alignment: .center)
                .accentColor(.white)
                .background(Color.blue)
                .cornerRadius(26)
                .padding()
                
                NavigationLink(destination: TopView()) {
                    Text("スタート画面に戻る").frame(width: 250, height: 60, alignment: .center)
                        .accentColor(.white)
                        .background(Color.blue)
                        .cornerRadius(26)
                        .padding()
                }
                
                Spacer().frame(height: 180)
                
            }
            
            
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
