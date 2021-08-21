//
//  AccountInfoListView.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/18.
//

import SwiftUI

struct AccountInfoListView: View {
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        
        NavigationView {
            accountList
        }
        
    }
}

extension AccountInfoListView {
    private var accountList: some View {
        
        ZStack {
            Image("background3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 80)
                
                NavigationLink(destination: AboutThisAppView()) {
                    listCell(title: "利用規約・プライバシーポリシー")
                }
                
                Spacer()
            }
            .frame(height: screen.height)
            .navigationBarTitle("アカウント情報")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func listCell(title: String) -> some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: 20)
            
            Text(title)
                .font(.title3)
                .foregroundColor(Color.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
            
            Spacer()
                .frame(width: 20)
        }
        .frame(width: screen.width, height: screen.height * 0.07, alignment: .leading)
        .background(Color.white)
    }
}

struct AccountInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoListView()
    }
}
