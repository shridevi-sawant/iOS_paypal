//
//  AddEmpView.swift
//  EmployeeApp
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

struct AddEmpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var id: String = ""
    @State private var salary: String = ""
    @State private var city: String = ""
    @State private var isError = false
    @State private var isAdded = false
   
    
    var body: some View {
        Form {
            Section {
                Text ("New Employee Details")
                TextField("Name", text: $name)
                TextField("Emp Id", text: $id)
                TextField("City", text: $city)
                TextField("Salary", text: $salary)
            }
            
            Section {
                Button(action: {
                    do {
                        try DBUtility.instance.addEmployee(name: name, id: Int(id) ?? 0, salary: Int(salary) ?? 0, city: city)
                        
                        isAdded = true
                        isError = false
                    }catch {
                        DBUtility.instance.dbContext.rollback()
                        isError = true
                        isAdded = false
                    }
                    
                }, label: {
                    Text("Add Employee")
                        .frame(maxWidth: .infinity)
                })
            }
            
            
        }
        .buttonStyle(BorderedProminentButtonStyle())
        .padding()
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .alert("Error adding employee", isPresented: $isError) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("OK")
            })
        }
        .alert("Employee Added", isPresented: $isAdded) {
            Button(action: {
                dismiss()
            }, label: {
                Text("OK")
            })
        }
        
    }
}

#Preview {
    AddEmpView()
}
