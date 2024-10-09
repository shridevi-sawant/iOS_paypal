//
//  LoginView.swift
//  InteropDemo
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    
    var body: some View {
        Form {
            VStack(spacing: 20) {
                Text("Welcome to PayPal")
                    
                TextField("Enter Name", text: $username)
                
                Button("Submit") {
                    
                }
                
                NavigationLink("REGISTER") {
                    RegisterView()
                }
                
            }
            .textFieldStyle(.roundedBorder)
            .buttonStyle(BorderedButtonStyle())
            .padding()
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LoginView()
}


struct RegisterView: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        // instantiate view controller
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "registervc")
    }
    
    
}
