//
//  ContentView.swift
//  UIDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct ContentView: View {
    
    let friends = ["john", "merry", "robert", "mark"]
    @State private var selectedFriend = ""
    
    var body: some View {
        
        List{
            Section(content: {
                Text("Welcome to PayPal")
                Text("Bangalore")
                Button("OK") {
                    
                }
            }, header:  {
                Text("Introduction")
            }
            )
            .listRowBackground(Color.yellow)
            
            
            Section {
                ForEach(friends, id: \.self) { name in
                   Label(name, systemImage: "person")
                        .onTapGesture {
                            selectedFriend = name
                        }
                }
                
                Text("Selected Friend: \(selectedFriend)")
                    .background(Color.gray)
                
            } header: {
                Text("Friends List")
            }

            Section {
                ForEach(0..<15){ i in
                    Text("Contact No \(i)")
                }
                
            } header: {
                Text("Contact Numbers")
            }

            
        }
        .listRowSpacing(10)
        .listSectionSpacing(20)
        .listStyle(.insetGrouped)
    }
}

#Preview {
    ContentView()
}
