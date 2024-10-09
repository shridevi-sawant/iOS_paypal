//
//  ContentView.swift
//  DataPersistency
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

/* Blog */

struct ContentView: View {
    
    @State private var blogText = ""
    @State private var isError = false
    @State private var licensText = ""
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
               Spacer()
               Text("What's on your mind")
               TextEditor(text: $blogText)
                    .frame(height: 200)
                
                Button("Save") {
                    // save to file
                    do {
                        try FileUtility.instance.writeToFile(data: blogText, filename: "blog.txt")
                    }catch {
                        isError = true
                    }
                }
                
                
                
                if (isError) {
                    Text("Could not save the blog..try again")
                }
               
                Spacer()
                Text(licensText)
                    .font(.footnote)
                    .italic()
                
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
        }
        .onAppear{
            print("onAppear executed")
            blogText = (try? FileUtility.instance.readFromFile(filename: "blog.txt")) ?? ""
            
            let url = Bundle.main.url(forResource: "license", withExtension: "txt")
            
            licensText = try! String(contentsOf: url!)
        }
        .onDisappear {
            print("onDisappear executed")
        }
    }
}

#Preview {
    ContentView()
}
