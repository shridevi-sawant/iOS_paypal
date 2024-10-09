//
//  SportsActivityView.swift
//  SwiftUIDemo
//
//  Created by Shridevi Sawant on 01/10/24.
//

import SwiftUI

struct SportsActivityView: View {
    
    @State var isBtnClicked = false
    
    var body: some View {
        ZStack {
            
            
//            LinearGradient(colors: [Color.blue, Color("skyBlue", bundle: .main)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack {
                    RoundedImage(systemImgName: "figure.wave.circle.fill", tintColor: Color.yellow, bgColor: Color.clear)
                    
                    TextWithBorderShadow(title: "John Smith", textColor: Color.yellow ,bgColor: Color.clear, borderColor: Color.clear )
                    
                    TextWithBorderShadow(title: "Sports Activities",
                                         fontSize: 35,
                                         
                                         textColor: Color.white,
                                         bgColor: Color.clear, borderColor: Color.clear)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            SportView(name: "Swimming", duration: 2, imgName: "figure.pool.swim")
                            SportView(name: "Cricket", duration: 2, imgName: "figure.cricket")
                            SportView(name: "Tennis", duration: 1, imgName: "figure.tennis")
                            SportView(name: "Golf", duration: 3, imgName: "figure.golf")
                        }.padding(.horizontal, 16)
                       
                    }
                    
                    Spacer(minLength: 20)
                    
                    RoundedButton(title: "Change Background", clickHandler: {
                        isBtnClicked.toggle()
                    })
                    
                    Spacer()

                }
            }
        }
        .background(isBtnClicked ? Color.green : Color.gray)
    }
}

#Preview {
    SportsActivityView()
}

