//
//  FirstView.swift
//  NavigationDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            Text("First View")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            NavigationLink("NEXT") {
                SecondView()
            }.buttonStyle(BorderedButtonStyle())
        }
        .navigationTitle("First View")
    }
}

#Preview {
    FirstView()
}
