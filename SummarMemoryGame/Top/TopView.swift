//
//  TopView.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/14.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationView {
            
            ZStack{
                Image("background2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                VStack{
                    Spacer().frame(height: 300)

/*                        Text("Memory Game")
                        .bold()
                        .font(.custom("Times-Roman", size: 50))*/
                    
                    Spacer()
                        .frame(height: 200)
                    
                    NavigationLink(
                        destination: FlyerListView()){
                            Text("スタート")
                                .bold()
                                .font(.title)
                                .padding()
                                .frame(width: 250, height: 80)
                                .background(Color.pink)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    NavigationLink(
                        destination: TopViewCollection()){
                            Text("チラシコレクション")
                                .bold()
                                .font(.system(size: 23, weight: .black, design: .default))
                                .padding()
                                .frame(width: 250, height: 80)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
            }
        }.navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
