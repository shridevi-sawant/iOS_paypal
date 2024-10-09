//
//  DetailView.swift
//  PayPalApp
//
//  Created by Shridevi Sawant on 09/10/24.
//

import SwiftUI

struct DetailView: View {
    @State var msg = "Welcome"
    
    var body: some View {
        Text(msg)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailView()
}
