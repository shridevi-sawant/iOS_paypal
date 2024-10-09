//
//  LoginView.swift
//  DataPersistency
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

struct LoginView: View {
    
    @AppStorage("userid") private var username = ""
    @AppStorage("password") private var pwd = ""
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack(spacing: 20){
                Text("Provide login credentials")
                    .foregroundStyle(Color.white)
                TextField("Email Address", text: $username)
                SecureField("Password", text: $pwd)
                
                Button("LOGIN") {
//                    UserDefaults.standard.set(username, forKey: "userid")
//                    UserDefaults.standard.set(pwd, forKey: "password")
                }
                
                
                Button("Logout") {
                    UserDefaults.standard.removeObject(forKey: "userid")
                    UserDefaults.standard.removeObject(forKey: "password")
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
            .textFieldStyle(.roundedBorder)
            
                .font(.title)
        }
        .onAppear{
//            username = UserDefaults.standard.string(forKey: "userid") ?? ""
//            pwd = UserDefaults.standard.string(forKey: "password") ?? ""
        }
    }
}

#Preview {
    LoginView()
}
