//
//  ImageDownloadView.swift
//  ConcurrencyDemo
//
//  Created by Shridevi Sawant on 07/10/24.
//

import SwiftUI

struct ImageDownloadView: View {
    
    @State private var isDownloading = false
    @State private var status = ""
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            VStack{
                Text("Async-Await Demo")
                
                Text(status)
                
                Button {
//                    let t1 = Task{
//                        let img1 = await downloadImage(name: "xyz.png")
//                        status = "\(img1) downloaded"
//                        let img2 = await downloadImage(name: "abc.jpg")
//                        status += "\n \(img2) downloaded"
//                        let img3 = await downloadImage(name: "paypal.jpg")
//                        status += "\n \(img3) downloaded"
//                        
//                    }
                    
                   let t2 = Task {
                        
                        async let img1 =  downloadImage(name: "xyz.png")
                       
                        async let img2 =  downloadImage(name: "abc.jpg")
                        
                        async let img3 =  downloadImage(name: "paypal.jpg")
                        
                        
                        
                       let result = await [img1, img2, img3]
                        status = "Downloded \(result[0]), \(result[1]), \(result[2])"
                        
                    }
                    
                    
                    
                    
                } label: {
                    Text("Start Download")
                }
                
                if (isDownloading){
                    ProgressView()
                        .foregroundStyle(Color.white)
                        
                }

            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .onAppear() {
            // after views
//            print("starting download")
//            Task{
//                await downloadImage(name: "abc.png")
//            }
        }
        .task {
            await downloadImage(name: "abc.png")
        }
        
    }
    
    // suspending functions
    func downloadImage(name: String) async -> String {
        // Download network call
        
        isDownloading = true
        // suspension point
        try! await Task.sleep(nanoseconds: 4 * 1000 * 1000 * 1000)// non-blocking
        
        isDownloading = false
        return name
    }
}



#Preview {
    ImageDownloadView()
}
