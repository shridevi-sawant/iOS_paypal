//
//  EmployeeListView.swift
//  EmployeeApp
//
//  Created by Shridevi Sawant on 04/10/24.
//

import SwiftUI

struct EmployeeListView: View {
    @State var empList : [Employee] = []
    @State var selectedEmp: Employee? = nil
    @State private var isDlg = false
    @State private var incrementBy = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List(empList, selection: $selectedEmp) { employee in
                    EmpView(emp: employee)
                        .swipeActions(edge: .trailing){
                            Button(action: {
                                try? DBUtility.instance.deleteEmp(emp: employee)
                                empList = DBUtility.instance.getAllEmployees()
                            }, label: {
                                
                                Image(systemName: "trash")
                            })
                        }
                        .onTapGesture {
                            selectedEmp = employee
                            isDlg = true
                        }
                }
                
                Text("Selected Emp: \(selectedEmp?.name ?? "")")
                
            }
           
            .alert("Salary Update", isPresented: $isDlg, actions: {
                
                Button(action: {
                    isDlg = false
                    do {
                        try DBUtility.instance.updateSalary(emp: selectedEmp!, newSalary: 100)
                        empList = DBUtility.instance.getAllEmployees()
                    }catch {
                        
                    }
                }, label: {
                    Text("OK")
                })
                
            }, message: {
                VStack {
                    Text("Enter value Salary increment")
                    TextField("Increment by", text: $incrementBy)
                }
            })
                .onAppear {
                    empList = DBUtility.instance.getAllEmployees()
                }
                .navigationTitle("Employee List")
                .toolbar(content: {
                    
                    ToolbarItemGroup {
                        NavigationLink {
                            AddEmpView()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                        Menu {
                            Button(action: {
                                empList = DBUtility.instance.getEmpSortedBySalary()
                            }, label: {
                                Text("Sort by Salary")
                            })
                            Button(action: {
                                empList = DBUtility.instance.getEmpByCity(cityName: "Pune")
                            }, label: {
                                Text("From Pune")
                                
                            })
                            Button(action: {
                                empList = DBUtility.instance.getEmpByCity(cityName: "Bangalore")
                            }, label: {
                                Text("From Bangalore")
                                
                            })
                            Button(action: {
                                empList = DBUtility.instance.getEmpByCity(cityName: "New York")
                            }, label: {
                                Text("From New York")
                                
                            })
                            Button(action: {
                                empList = DBUtility.instance.getAllEmployees()
                            }, label: {
                                Text("Show All")
                                
                            })
                            
                        } label: {
                            Image(systemName: "ellipsis.circle.fill")
                        }
                        
                    }
                    
                })
                
                
            
        }
        
    }
}

struct EmpView: View {
    let emp: Employee
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            Spacer()
            VStack{
                Text("Name: \(emp.name ?? "")")
                Text("Id: \(emp.empId)")
                Text("Salary: \(emp.salary)")
                Text("City: \(emp.city ?? "")")
            }
            Spacer()
        }
        .foregroundStyle(Color.blue)
        
    }
}


#Preview {
    EmployeeListView()
}


