//
//  HomeView.swift
//  UIDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Group {
                EmployeeView()
                    .tabItem {
                        Label("Emp", systemImage: "person")
                    }
                
                
                ContentView()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                
                AnimalsView()
                    .tabItem {
                        Label("Grid", systemImage: "square.grid.3x3.fill")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Account", systemImage: "person.fill")
                    }
                
                Text("Tab 5")
                    .tabItem {
                        Label("TAB 5", systemImage: "globe")
                    }
                
                Text("Tab 6")
                    .tabItem {
                        Label("TAB 6", systemImage: "globe")
                    }
                
                Text("Tab 7")
                    .tabItem {
                        Label("TAB 7", systemImage: "globe")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color.primary, for: .tabBar)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

#Preview {
    HomeView()
}
