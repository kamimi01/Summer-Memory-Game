//
//  FlyerListViewModel.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/14.
//

import Foundation

class FlyerListViewModel: ObservableObject {
    
    private var allImageList = ["flyer1", "flyer2", "flyer3", "flyer4", "flyer5",
                                "flyer6", "flyer7", "flyer8", "flyer9", "flyer10",
                                "flyer11", "flyer12","flyer13", "flyer14", "flyer15", "flyer16", "flyer17", "flyer18", "flyer19", "flyer20", "flyer21", "flyer22", "flyer23", "flyer24"]
    
    @Published var imageList: [String] = []
    
    @Published var imageStatusList = Array(repeating: false, count: 24)
    
    @Published var selectedImageList: [String] = []
    
    @Published var isSecondTurn = false
    
    @Published var result = false
    
    @Published var alertText = ""
    
    @Published var pointForFirst = 0
    
    @Published var pointForSecond = 0
    
    @Published var winner: GameResult = GameResult.even
    
    @Published var isGameOver = false
    
    init() {
        createRandomOrder()
//        createNotRandomOrder() // デバッグ用メソッド
    }
    
    private func createNotRandomOrder() {
        let randomImageList = allImageList.shuffled().prefix(12)
        
        imageList.append(contentsOf: randomImageList)
        imageList.append(contentsOf: randomImageList)
    }
    
    private func createRandomOrder() {
        // ランダムに12こ値を選択する
        var randomImageList = allImageList.shuffled().prefix(12)
        
        // 同じ値を倍に増やしてimageListの配列に入れる
        imageList.append(contentsOf: randomImageList)
        imageList.append(contentsOf: randomImageList)
        
        // 再度シャッフルする
        imageList = imageList.shuffled().prefix(24).reversed().reversed()
    }
    
    func updateImageList(selectedIndex: Int, selectedImage: String) {
        imageStatusList[selectedIndex] = true
        print("更新後のリスト：\(imageStatusList)")
        
        selectedImageList.append(selectedImage)
        
        print("更新後のリスト2：\(selectedImageList)")
        
        if selectedImageList.count == 2 {
            
            result = true
            // カードが同じかどうか
            print(selectedImageList[0])

            // 同じカードだった場合
            if selectedImageList[0] == selectedImageList[1] {
                alertText = "ビンゴ！！"
                
                // 得点の増加
                if !isSecondTurn {
                    pointForFirst = pointForFirst + 1
                } else {
                    pointForSecond = pointForSecond + 1
                }
            } else {
                // 異なるカードだった場合
                alertText = "ざんねん..."
            }
        }

        print("結果は：\(result)")
    }
    
    func switchTurn() {
        if selectedImageList.count == 2 {
            if selectedImageList[0] == selectedImageList[1] {
                for _ in imageList {
                    if let selectedIndexFor2 = imageList.index(where: {$0 == selectedImageList[0]}) {
                        imageList[selectedIndexFor2] = ""
                    }
                }
                
                print("画像のリスト：\(imageList)")
            }
            
            // 選択されたカードのリストを空に戻す
            selectedImageList = []
        }
        
        // 選択状態をリセットする
        selectedImageList = []

        // 全て裏に戻す
        imageStatusList = Array(repeating: false, count: 24)

        // 次の人のターンに切り替える
        isSecondTurn = !isSecondTurn
        
        print("更新後のリスト3：\(selectedImageList)")
        
        calcResult()
    }
    
    private func calcResult() {
        // imageListの中身が全て空の場合は、ゲーム終了
        if (imageList.allSatisfy{ $0.isEmpty == true }) {
            isGameOver = true
            
            if pointForFirst == pointForSecond {
                winner = GameResult.even
            } else if pointForFirst < pointForSecond {
                winner = GameResult.player2
            } else {
                winner = GameResult.player1
            }

            return
        }
    }
}
