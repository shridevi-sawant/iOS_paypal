//
//  ContentView.swift
//  MemoryLeakDemo
//
//  Created by Shridevi Sawant on 09/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vModel = MyViewModel()
    
    @State var result = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, \(vModel.message) ")
            
            Button(action: {
                vModel.greeting()
            }, label: {
                Text("OK")
            })
            .buttonStyle(BorderedProminentButtonStyle())
            
            Button(action: {
                vModel.doProcessing {
                    self.result = 100
                    return "Filtering"
                }
            }, label: {
                Text("Process")
            })
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
