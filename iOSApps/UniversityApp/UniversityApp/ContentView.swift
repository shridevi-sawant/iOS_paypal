//
//  ContentView.swift
//  UniversityApp
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var univ: University
    
    var body: some View {
        
        NavigationStack {
            List(univ.stdList) { std in
                StudentView(student: std)
                    .swipeActions(edge: .trailing){
                        Button(action: {
                            univ.deleteStudent(stdToDelete: std)
                        }, label: {
                            Image(systemName: "trash")
                        })
                    }
            }
            .navigationTitle("Students of \(univ.name)")
            .toolbar(content: {
                ToolbarItemGroup {
                    
                    
                    NavigationLink {
                        NewStudentView()
                            .environmentObject(univ)
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    Menu {
                        Button(action: {univ.sortByName()}, label: {
                            Label("Sort by name", systemImage: "line.3.horizontal.decrease.circle.fill")
                            
                        })
                        
                        Button(action: {univ.sortByMarks()}, label: {
                            Label("Sort by marks", systemImage: "line.3.horizontal.decrease.circle")
                        })
                        
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }

                    
                    
                }
                
            })
        }
    }
}

struct StudentView: View {
    let student: Student
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            
            VStack {
                Text(student.name)
                Text("Roll: \(student.id)")
                Text("Marks: \(student.marks)")
            }
        }
    }
}



//#Preview {
//   
//    ContentView()
//        
//}
