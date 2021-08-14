//
//  FlyerListView.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/14.
//

import SwiftUI

enum GameResult {
    case player1
    case player2
    case even
    
    var resultText: String {
        switch self {
        case .player1:
            return "プレーヤー1"
        case .player2:
            return "プレーヤー2"
        case .even:
            return "引き分け"
        }
    }
}

struct FlyerListView: View {
    
    private var screen = UIScreen.main.bounds
    
    @State private var isHead = true
    
    @ObservedObject var viewModel = FlyerListViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 5)
            
            flyerList
            
            pointResult(isSecondTurn: viewModel.isSecondTurn, pointForFirstPerson: viewModel.pointForFirst, pointForSecondPerson: viewModel.pointForSecond)
        }
    }
}

extension FlyerListView {
    private var flyerList: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: GamePlayResult(gameResult: $viewModel.winner),
                               isActive: $viewModel.isGameOver) {
                    EmptyView()
                }
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 10) {
                        ForEach(0..<viewModel.imageList.count, id: \.self) { index in
                            
                            Button(action: {
                                viewModel.updateImageList(selectedIndex: index, selectedImage: viewModel.imageList[index])
                                print(viewModel.imageList)
                            }) {
                                if viewModel.imageStatusList[index] {
                                    Image(viewModel.imageList[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 100)
//                                        .border(Color.green)
                                } else {
                                    // imageListが空の場合は、空の四角を表示する
                                    if viewModel.imageList[index].isEmpty {
                                        Text("")
                                            .frame(width: 70, height: 100)
        //                                    .border(Color.pink)
                                    } else {
                                        Image("reverse")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 70, height: 100)
//                                            .border(Color.green)
                                    }
                                }
                            }
                            .disabled(viewModel.imageList[index].isEmpty)
                        }
                    }
                }
                .frame(width: screen.width * 0.9, height: screen.height * 0.8)
                .alert(isPresented: $viewModel.result) {
                    Alert(title: Text("結果"),
                          message: Text(viewModel.alertText),
                          dismissButton: .default(Text("OK"),
                                                  action: {
                                                    print("OKがタップされた")
                                                    viewModel.switchTurn()
                                                  })) // ボタンがタップされた時の処理
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func pointResult(isSecondTurn: Bool, pointForFirstPerson: Int, pointForSecondPerson: Int) -> some View {
        HStack(spacing: 0) {
            point(isSecondTurn: isSecondTurn, point: pointForFirstPerson)
            
            Spacer()
            
            point(isSecondTurn: !isSecondTurn, point: pointForSecondPerson)
        }
        .frame(width: screen.width * 0.9, height: screen.height * 0.1)
    }
    
    private func point(isSecondTurn: Bool, point: Int) -> some View {
        VStack(spacing: 0) {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(isSecondTurn ? Color.red : Color.white)
                .frame(width: screen.width * 0.25, height: screen.height * 0.03)
            
            Spacer()
                .frame(height: 5)
            
            Text(String(describing: point))
                .font(.title)
        }
        .frame(width: screen.width * 0.4, height: screen.height * 0.1)
        .background(isSecondTurn ? Color.clear : Color.red)
    }
}

struct FlyerListView_Previews: PreviewProvider {
    static var previews: some View {
        FlyerListView()
    }
}
