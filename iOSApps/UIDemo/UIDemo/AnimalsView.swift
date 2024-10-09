//
//  AnimalsView.swift
//  UIDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct AnimalsView: View {
    
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVGrid(columns: gridLayout,spacing: 10) {
                ForEach(0 ..< 15) { item in
                    GridRow {
                        VStack {
                            Image("lion", bundle: .main)
                                .resizable()
                            .frame(width:100, height: 150)
                            .foregroundStyle(Color(red: 0.1 * Double(item), green: 1, blue: 0.1))
                            
                            Text("Dog ")
                        }
                        .padding()
                        
                    }
                    .padding()
                    .background(Color(red: 0.1 * Double(item), green: 0.5, blue: 0.5))
                    .clipShape(.capsule)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AnimalsView()
}
