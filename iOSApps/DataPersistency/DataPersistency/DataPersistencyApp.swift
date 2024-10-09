//
//  DataPersistencyApp.swift
//  DataPersistency
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

@main
struct DataPersistencyApp: App {
    
    init() {
        print("Home Dir: \(NSHomeDirectory())")
    }
    
    var body: some Scene {
        
        WindowGroup {
           // ContentView()
            LoginView()
        }
    }
}
