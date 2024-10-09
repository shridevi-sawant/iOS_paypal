//
//  SettingsView.swift
//  SwiftUIDemo
//
//  Created by Shridevi Sawant on 01/10/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isGPSOn: Bool = false
    @State var bgColor: Color = Color.mint
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack {
                
                Toggle("GPS ", isOn: $isGPSOn)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 200)
                    .tint(Color.black)
                
                Divider()
                    .foregroundStyle(.black)
                    .frame(height: 4)
                
                TextWithBorderShadow(title: isGPSOn ? "Your location is getting tracked" : "Location tracking is disabled")
                
                if isGPSOn {
                    LocationView(selectedColor: $bgColor)
                }
                
            }.padding(40)
        }
    }
}

struct LocationView: View {
    
    @Binding var selectedColor : Color
    
    var body: some View {
        
        VStack {
            Text("Current Location is 12.78, 77.90")
            
            ColorPicker("Select Color", selection: $selectedColor)
           
        }
    }
}

#Preview {
    SettingsView()
}
