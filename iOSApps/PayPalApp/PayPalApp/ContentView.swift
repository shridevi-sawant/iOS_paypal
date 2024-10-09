//
//  ContentView.swift
//  PayPalApp
//
//  Created by Shridevi Sawant on 09/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var mobileNum = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.ignoresSafeArea()
                VStack {
                   
                    
                    if name.isEmpty {
                        Text("Hello, World!")
                    } else {
                        Text("Hello, \(name)!")
                    }
                    
                    TextField("Enter your name", text: $name)
                    
                    Text("Mobile number")
                    TextField("", text: $mobileNum)
                        .accessibilityLabel("mobile")
                    
//                    Button(action: {
//                        
//                    }
//                           , label: {
//                        Text("NEXT")
//                    })
                    NavigationLink(destination: {
                        DetailView(msg: name)
                    }, label: {
                        Text("NEXT")
                    })
                    .buttonStyle(BorderedProminentButtonStyle())
        
                }
                .textFieldStyle(.roundedBorder)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
