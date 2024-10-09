//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Shridevi Sawant on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var status = "Welcome"
    @State private var isDownloading = false
    @State private var isUploading = false
    
    let opQueue = OperationQueue()
    //var uploadOp : BlockOperation? = nil
    
   
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(status)
                
                Button(action: {
                    downloadImage(img: "xyz.jpg")
                    
                }, label: {
                    Text("Download")
                })
                .disabled(isDownloading)
                
                Button(action: {
                    uploadData()
                }, label: {
                    Text("Upload")
                })
                .disabled(isUploading)
                
                Button(action: {
                    opQueue.cancelAllOperations()
                }, label: {
                    Text("Cancel Upload")
                }).disabled(!isUploading)
                
                if (isDownloading) {
                    ProgressView {
                        Text("Please Wait")
                    }
                    
                    .frame(width: 200, height: 100)
                        .foregroundStyle(.white)
                }
                
                if (isUploading) {
                    ProgressView {
                        Text("Uploading...")
                    }
                    
                    .frame(width: 200, height: 100)
                        .foregroundStyle(.blue)
                }
            
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
        }
        .onAppear{
           
        }
        
    }
    
    func doTask(){
        
        for i in 0...1_000_000{
            DispatchQueue.global().async {
                print(". \(i)")
                Thread.sleep(forTimeInterval: 10)
            }
        }
    }
    
    
     func uploadData(){
        isUploading = true
        let uploadOp = BlockOperation ()
        uploadOp.addExecutionBlock {
            // TODO - upload some data over network
            
            Thread.sleep(forTimeInterval: 4)
            isUploading = false
            
            if (uploadOp.isFinished){
                print("Completed..")
                
            }
        }
        opQueue.addOperation(uploadOp)
    }
    
    // GCD - no cancellation
    func downloadImage(img: String){
        status = "Downloading \(img)..."
        
        isDownloading = true
        
        DispatchQueue.global().async {
            // TODO download network call
            print("executed by Main?  \(Thread.isMainThread)")
            
            Thread.sleep(forTimeInterval: 4)
            
            status = "Download complete"
            isDownloading = false
        }
        
        print("returning from downloadImage")
    }
    
    
}




#Preview {
    ContentView()
}
