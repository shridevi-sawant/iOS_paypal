//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var names = ["John", "Merry", "Robert"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink("Go To First") {
                    FirstView()
                }
                
                NavigationLink {
                    SecondView()
                } label: {
                    Label("Go To Second", systemImage: "globe")
                }

                List {
                    ForEach(names, id: \.self) { name in
                        NavigationLink(name, value: name)
                    }
                    
                    Section {
                        NavigationLink("Continue", value: 1)
                    }
                }
                
            }
            .navigationDestination(for: Int.self, destination: { idx in
                GreetingView(personName: "PayPal \(idx)")
            })
            .navigationDestination(for: String.self, destination: { str in
                GreetingView(personName: str)
            })
            
            .navigationTitle("Welcome")
            .padding()
            .buttonStyle(BorderedButtonStyle())
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ContentView()
}
