//
//  GreetingView.swift
//  NavigationDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct GreetingView: View {
    var personName = ""
    
    var body: some View {
        Text("Hello, \(personName)!")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GreetingView()
}
