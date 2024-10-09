//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Shridevi Sawant on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // use specific modifier first in order. Use generic modifiers after specific
        
        ZStack {
            LinearGradient(colors: [Color.green, Color.brown, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                RoundedImage(systemImgName: "person.crop.circle")
                 
                TextWithBorderShadow(title: "Hello PayPal", bgColor: Color.orange, borderColor: Color.clear)
                
            }
            .padding(30)
            .frame(width: 400, height: 700)
       
        }
    }
}

#Preview {
    ContentView()
}



