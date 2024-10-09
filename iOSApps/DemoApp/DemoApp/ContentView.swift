//
//  ContentView.swift
//  DemoApp
//
//  Created by Shridevi Sawant on 08/10/24.
//

import SwiftUI
import MyFramework
import MyLocationLibrary

struct ContentView: View {
    @State private var result = 0
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Result: \(result)")
            
            Button(action: {
               result = MathUtility().add(a: 10, b: 20)
                LocationUtility().getLocation()
            }, label: {
                Text("ADD")
            })
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
