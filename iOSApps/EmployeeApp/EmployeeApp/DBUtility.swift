//
//  DBUtility.swift
//  EmployeeApp
//
//  Created by Shridevi Sawant on 04/10/24.
//

import Foundation

struct DBUtility {
    
    static let instance = DBUtility()
    let dbContext = PersistenceController.shared.container.viewContext
    
    private init(){
        
    }
    
    func addEmployee(name: String, id: Int, salary: Int, city: String) throws {
        // insert
        let emp = Employee(context: dbContext)
        emp.name = name
        emp.city = city
        emp.empId = Int16(id)
        emp.salary = Int16(salary)
        
        try dbContext.save()
        
    }
    
    func deleteEmp(emp : Employee) throws {
        dbContext.delete(emp)
        try dbContext.save()
            
    }
    
    func updateSalary(emp: Employee, newSalary: Int) throws{
        emp.salary += Int16(newSalary)
        
       try dbContext.save()
    }
    
    func getAllEmployees() -> [Employee] {
        // query
        
        let request = Employee.fetchRequest()
        
        guard let result = try? dbContext.fetch(request) else {
            return []
        }
        
        return result
    }
    
    func getEmpSortedBySalary() -> [Employee]{
        let request = Employee.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "salary", ascending: false)]
        
        guard let result = try? dbContext.fetch(request) else {
            return []
        }
        
        return result
    }
    
    func getEmpByCity(cityName: String) -> [Employee]{
        let request = Employee.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "salary", ascending: false)]
        request.predicate = NSPredicate(format: "city == %@", cityName)
        
        guard let result = try? dbContext.fetch(request) else {
            return []
        }
        
        return result
    }
    
}
