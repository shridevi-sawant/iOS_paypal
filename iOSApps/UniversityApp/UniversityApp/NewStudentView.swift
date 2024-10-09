//
//  NewStudentView.swift
//  UniversityApp
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct NewStudentView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var roll = ""
    @State private var marks = ""
    @State private var isAdded = false
    
    @EnvironmentObject var univ: University
    
    var body: some View {
        
        Form {
            Section(content: {
                TextField("Name", text: $name)
                TextField("Roll No", text: $roll)
                TextField("Marks", text: $marks)
            }, header: {
                Text("Student Info")
            })
            
            Section {
                Button {
                    let std = Student(name: name,
                                      id: Int(roll) ?? 0,
                                      marks: Int(marks) ?? 0)
                    
                    univ.addStudent(std: std)
                    isAdded = true
                    
                } label: {
                    Text("Add Student")
                }

            }
        }
        .alert("\(name) is added", isPresented: $isAdded, actions: {
            Button(action: {
                dismiss()
            }, label: {
                Text("OK")
            })
        })
//        .sheet(isPresented: $isAdded, content: {
//            
//            Text("Student \(name) is added")
//                .presentationDetents([.medium])
//        })
        .buttonStyle(BorderedButtonStyle())
        .textFieldStyle(.roundedBorder)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewStudentView()
        
}
