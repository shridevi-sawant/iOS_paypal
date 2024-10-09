//
//  CustomViews.swift
//  SwiftUIDemo
//
//  Created by Shridevi Sawant on 01/10/24.
//

import Foundation
import SwiftUI

struct TextWithBorderShadow: View {
    
    let title: String
    let fontSize: CGFloat
    let textColor: Color
    let bgColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let shadowColor: Color
    
    init(title: String, fontSize: CGFloat = 30,
         textColor: Color = Color.blue,
         bgColor: Color = Color.white,
         borderColor: Color = Color.black,
         borderWidth: CGFloat = 2,
         shadowColor: Color = Color.yellow)
    {
        self.title = title
        self.fontSize = fontSize
        self.textColor = textColor
        self.bgColor = bgColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.shadowColor = shadowColor
    }
    
    var body: some View {
        Text(title)
            
            .font(.system(size: fontSize))
            .fontWeight(.heavy)
            .bold()
            .foregroundStyle(textColor)
            .fixedSize(horizontal: false, vertical: true)
            .padding(20)
            .background(bgColor)
            .border(borderColor, width: borderWidth)
            .shadow(color: shadowColor, radius: 5)
    }
}


struct RoundedImage: View {
    
    let systemImgName : String
    let imgWidth: CGFloat
    let imgHeight: CGFloat
    let tintColor: Color
    let bgColor: Color
   
    
    init(systemImgName: String, 
         imgWidth: CGFloat = 150,
         imgHeight: CGFloat = 150,
         tintColor: Color = Color.blue,
         bgColor: Color = Color.white
         ) {
        self.systemImgName = systemImgName
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
        self.tintColor = tintColor
        self.bgColor = bgColor
       
    }
    
    var body: some View {
        Image(systemName: systemImgName)
            .resizable()
            .scaledToFit()
            .frame(width: imgWidth, height: imgHeight)
            .foregroundStyle(tintColor)
            .padding(20)
            .background(bgColor)
            .clipShape(.rect(cornerRadius: 20))
    }
}


struct RoundedButton: View {
    
    let title: String
    let clickHandler: () -> Void
    
    var body: some View {
        Button(action: {
            
            clickHandler()
            
        }, label: {
            Text(title)
                .bold()
                .font(.title)
                .foregroundStyle(.white)
        })
        .frame(height: 50)
        .padding(16)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}
