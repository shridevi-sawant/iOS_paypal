//
//  EmployeeView.swift
//  UIDemo
//
//  Created by Shridevi Sawant on 03/10/24.
//

import SwiftUI

struct Employee: Identifiable {
    var id: Int // emp Id
    var name: String
    var city: String
}

struct EmployeeView: View {
    
    var empList = [Employee(id: 1, name: "John", city: "Bangalore"),
                   Employee(id: 2, name: "Meryy", city: "New York"),
                   Employee(id: 3, name: "Robert", city: "Phoenix"),
                   Employee(id: 4, name: "Mark", city: "New Jersey"),
                   Employee(id: 5, name: "Tom", city: "London")]
    
    var body: some View {
        List {
            ForEach(empList) { emp in
                EmpView(employee: emp)
            }.listRowBackground(Color.green)
            .swipeActions(edge: .trailing){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "trash")
                    })
                }
        }
        .listRowSpacing(8)
        .foregroundStyle(Color.white)
        
    }
}

struct EmpView: View {
    let employee: Employee
    var body: some View {
        HStack() {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            
            Spacer()
            VStack {
                Text(employee.name)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.blue)
                
                Text("Emp Id: \(employee.id)")
                Text("City: \(employee.city)")
                
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    EmployeeView()
}
