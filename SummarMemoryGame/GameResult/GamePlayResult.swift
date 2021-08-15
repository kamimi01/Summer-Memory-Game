//
//  GamePlayResult.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/14.
//

import SwiftUI
import AVFoundation

struct GamePlayResult: View {
    @State private var isShowing = false
    @Binding var gameResult: GameResult
    
    private let fearSound = try! AVAudioPlayer(data: NSDataAsset(name: "fear")!.data)
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                VStack{
                    
                    Spacer()
                    
                    if gameResult==GameResult.player1{
                        Text("先攻の勝利").font(.system(size: 50, weight:.bold, design:.default))
                            .frame(width: 400, height: 200, alignment: .center)
                            .multilineTextAlignment(.center)
                    }else if gameResult==GameResult.player2{
                        Text("後攻の勝利").font(.system(size: 50, weight:.bold, design:.default))
                            .frame(width: 400, height: 200, alignment: .center)
                            .multilineTextAlignment(.center)
                    }else{
                        Text("引き分け").font(.system(size: 50, weight:.bold, design:.default))
                            .frame(width: 300, height: 200, alignment: .center)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                        .frame(height: 90)
                    
                    Button(action: {
                        self.isShowing.toggle()
                    }) {
                        Text("罰ゲーム").bold()
                            .font(.system(size: 23, weight: .black, design: .default))
                            .padding()
                            .frame(width: 250, height: 80)
                            .background(Color.purple)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }.sheet(isPresented: $isShowing){
                        ModalView()
                            .ignoresSafeArea()
                            .onAppear{
                                fearSound.play()
                            }
                    }
                    
                    Spacer()
                        .frame(height: 15)
                    
                    NavigationLink(destination: TopView()) {
                        Text("スタートに戻る").bold()
                            .font(.system(size: 23, weight: .black, design: .default))
                            .padding()
                            .frame(width: 250, height: 80)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    Spacer()
                        .frame(height: 60)
                    
                }
                
                
            }
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GamePlayResult_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayResult(gameResult: .constant(GameResult.even))
    }
}

struct ModalView: View {
    var body: some View {
        let randomInt = Int.random(in: 1..<4)
        let imageName = "horror"+String(randomInt)
        Image(imageName).resizable()
            .scaledToFill()
    }
}
