//
//  ProfileView.swift
//  UIDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var name = ""
    @State private var address = ""
    @State private var dob = Date()
    @State private var isAccepted = false
    
    var body: some View {
        
        Form {
            
            Section {
                Image(systemName: "person.crop.rectangle")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                TextField("Full Name", text: $name)
                
                Text("Residential Address")
                TextEditor(text: $address)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
            } header: {
                Text("Profile")
            }
            
            Section {
                DatePicker("DOB", selection: $dob, displayedComponents: .date)
                    .datePickerStyle(.automatic)
                    
                Toggle("Accept Privacy License", isOn: $isAccepted)
                
                Link("Visit our Website", destination: URL(string: "https://paypal.com")!)
            } header: {
                Text("Required")
            }


        }
    }
}

#Preview {
    ProfileView()
}
