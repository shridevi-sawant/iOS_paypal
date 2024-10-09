//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Shridevi Sawant on 01/10/24.
//

import SwiftUI


struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var isPwdValid = true
    @State var showAlert = false
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            
            VStack(spacing: 40){
                TextWithBorderShadow(title: "Welcome to PayPal", bgColor: Color.clear)
                
                
                HStack {
                    Text("Username:")
                    
                    
                    
                    TextField(text: $username) {
                        Text("Enter Email Id")
                           
                    }
                    .keyboardType(.emailAddress)
                    .frame(width: 200)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(16)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .background()
                }
                
                HStack {
                    Text("Password:")
                    SecureField(text: $password) {
                        Text("Minimum 8 chars")
                    }
                    
                    .keyboardType(.namePhonePad)
                    .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .frame(width: 200)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(16)
                    .border(isPwdValid ? /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ : Color.red)
                    .background()
                    
                    .onSubmit {
                        isPwdValid = password.count >= 8
                    }
                    
                }
                Spacer().frame(height: 20)
                RoundedButton(title: "LOGIN") {
                    print("Username: \(username)")
                    print("Password: \(password)")
                    
                    showAlert = true
                }.disabled(!isPwdValid)
                
                Spacer()
                    .frame(height: 100)
               
            }
            
            .sheet(isPresented: $showAlert, content: {
               ConfirmationView(uname: $username, pwd: $password, isSheetVisible: $showAlert)
                    .presentationDetents([.height(400)])
                    
            })
            
//            .alert("Username: \(username), Password: \(password)", isPresented: $showAlert) {
//                Text("OK")
//            }
        }
    }
}

struct ConfirmationView: View {
    @Binding var uname: String
    @Binding var pwd: String
    @Binding var isSheetVisible: Bool
    
    var body: some View {
        
        VStack {
            
            TextWithBorderShadow(title: "You entered \nUsername: \(uname),\nPassword: \(pwd)")
            
            RoundedButton(title: "Dismiss") {
                isSheetVisible = false
            }
            
            RoundedButton(title: "Clear Credentials") {
                uname = ""
                pwd = ""
                isSheetVisible = false
            }
        }
        
        
    }
}


#Preview {
  LoginView()
}
