//
//  ViewModel.swift
//  MemoryLeakDemo
//
//  Created by Shridevi Sawant on 09/10/24.
//

import Foundation

class MyViewModel : ObservableObject {
    
    @Published var message = ""
    var handler : (() -> String)? = nil
    
    func greeting(){
        let std1 = Student(name: "John", id: 1)
        let univ = University(name: "XYZ University")
        
        univ.topper = std1
        std1.institute = univ
        
        message = "\(univ.name) has topper: \(std1.name)"
    }
    
    func doProcessing(operation: @escaping () -> String){
        message = "Processing... "
        
        handler = operation
    }
    
}

class Student {
    var name: String
    var id: Int
    var institute: University? = nil
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
        print("\(name) student init")
    }
    
    deinit{
        print("\(name) std is deallocating")
    }
}

class University {
    var name: String
    weak var topper: Student?
    
    init(name: String) {
        self.name = name
        print("\(name) univ init")
    }
    
    deinit {
        print("\(name) univ is deallocating")
    }
}
