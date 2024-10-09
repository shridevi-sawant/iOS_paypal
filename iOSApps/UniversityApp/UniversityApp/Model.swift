//
//  Model.swift
//  UniversityApp
//
//  Created by Shridevi Sawant on 03/10/24.
//

import Foundation

struct Student: Identifiable {
    var name: String
    var id: Int
    var marks: Int
}

class University: ObservableObject {
    var name: String = "IIT Roorkee"
    
    @Published var stdList: [Student] = []
    
    func addStudent(std: Student){
        stdList.append(std)
    }
    
    func deleteStudent(stdToDelete: Student){
        
        stdList.removeAll { std in
            std.id == stdToDelete.id
        }
    }
    
    func sortByName(){
        stdList.sort { std1, std2 in
            std1.name < std2.name
        }
    }
    
    func sortByMarks(){
        stdList.sort { std1, std2 in
            std1.marks > std2.marks
        }
    }
}
