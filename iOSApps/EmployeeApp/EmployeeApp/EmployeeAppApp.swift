//
//  EmployeeAppApp.swift
//  EmployeeApp
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

@main
struct EmployeeAppApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        print(NSHomeDirectory())
    }

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
           // AddEmpView()
            EmployeeListView()
        }
    }
}
