//
//  TopViewCollection.swift
//  SummarMemoryGame
//
//  Created by Ryo Tomiki on 2021/08/14.
//

import SwiftUI

struct TopViewCollection: View {
    
    @State private var showingModal = false
    @State private var flyer: String = "flyer1"
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(spacing: 0), count: 4), spacing: 10) {
            ForEach((1...24), id: \.self) { index in
                Button(action: {
                    self.flyer = "flyer\(index)"
                    self.showingModal.toggle()
                }) {
                    Image("flyer\(index)")
                        .resizable()
                        .frame(width: 70, height: 100)
                }.sheet(isPresented: $showingModal) {
                    TopViewFlyer(isActive: $showingModal, flyer: flyer)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TopViewFlyer: View {
    @Binding var isActive: Bool
    let flyer: String
    
    var body: some View {
        VStack{
            Button(action: {
                self.isActive.toggle()
            }) {
                HStack{
                    Text("Close")
                    
                    Spacer().frame(width: 300)
                }
            }
            
            Spacer().frame(height: 130)
            
            Image(flyer)
            
            Spacer().frame(height: 70)
        }
    }
}

struct TopViewCollection_Previews: PreviewProvider {
    static var previews: some View {
        TopViewCollection()
    }
}
