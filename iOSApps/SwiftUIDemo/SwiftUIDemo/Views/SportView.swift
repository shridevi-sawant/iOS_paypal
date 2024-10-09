//
//  SportView.swift
//  SwiftUIDemo
//
//  Created by Shridevi Sawant on 01/10/24.
//

import SwiftUI

struct SportView: View {
    
    let name: String
    let duration: Int
    let imgName: String
    
    var body: some View {
        VStack {
            TextWithBorderShadow(title: name, textColor: Color.white,
                                 bgColor: Color.clear,
                                 borderColor: Color.clear)
            
            RoundedImage(systemImgName: imgName, imgWidth: 80,
                         imgHeight: 100,
                         tintColor: Color.indigo,
                         bgColor: Color.clear )
            
            TextWithBorderShadow(title: "\(duration) hr",
                                 textColor: Color.black,
                                 bgColor: Color.clear,
                                 borderColor: Color.clear)
        }
        .frame(width: 150, height: 300)
        .padding(EdgeInsets(top: 20, leading: 2, bottom: 20, trailing: 2))
        .background(Color.mint)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    SportView(name: "Cricket", duration: 1, imgName: "figure.cricket")
}
