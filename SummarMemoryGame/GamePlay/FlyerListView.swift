//
//  FlyerListView.swift
//  SummarMemoryGame
//
//  Created by Mika Urakawa on 2021/08/14.
//

import SwiftUI

struct FlyerListView: View {
    
    private var screen = UIScreen.main.bounds
    
    @State private var isHead = true
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 60)
            
            flyerList
            
            Spacer()
            
            pointResult()
        }
    }
}

extension FlyerListView {
    private var flyerList: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 10) {
                ForEach((1...52), id: \.self) { index in
                    
                    Button(action: {
                        isHead.toggle()
                    }) {
                        if isHead {
                            Image(systemName: "info.circle.fill")
                                .frame(width: 70, height: 100)
                                .border(Color.green)
                        } else {
                            Image(systemName: "info.circle")
                                .frame(width: 70, height: 100)
                                .border(Color.green)
                        }
                    }
                }
            }
        }
        .frame(width: screen.width * 0.9, height: screen.height * 0.6)
    }
    
    private func pointResult() -> some View {
        HStack(spacing: 0) {
            point()
                .background(Color.blue)
            
            Spacer()
            
            point()
        }
        .frame(width: screen.width * 0.9, height: screen.height * 0.25)
    }
    
    private func point() -> some View {
        VStack(spacing: 0) {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.red)
                .frame(width: screen.width * 0.4, height: screen.height * 0.1)
            
            Spacer()
                .frame(height: 20)
            
            Text("10")
                .font(.title)
        }
        .frame(width: screen.width * 0.45, height: screen.height * 0.2)
    }
}

struct FlyerListView_Previews: PreviewProvider {
    static var previews: some View {
        FlyerListView()
    }
}
