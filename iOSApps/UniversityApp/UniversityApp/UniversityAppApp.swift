//
//  UniversityAppApp.swift
//  UniversityApp
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

@main
struct UniversityAppApp: App {
    
    let univ = University()
    
    init() {
        univ.addStudent(std: Student(name: "Demo", id: 1, marks: 20))
        univ.addStudent(std: Student(name: "Test", id: 2, marks: 80))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(univ)
        }
    }
}
