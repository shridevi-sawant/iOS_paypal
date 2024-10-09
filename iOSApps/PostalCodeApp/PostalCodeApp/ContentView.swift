//
//  ContentView.swift
//  PostalCodeApp
//
//  Created by Shridevi Sawant on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var postalCode = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mint.ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("Postal Code Search")
                    TextField("6 digit postal code", text: $postalCode)
                        .keyboardType(.phonePad)
                    
                    
                    NavigationLink {
                        PlaceListView(pincode: postalCode)
                    } label: {
                        Text("SEARCH")
                    }
                    .disabled(postalCode.count != 6)

                }
                .buttonStyle(BorderedProminentButtonStyle())
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
