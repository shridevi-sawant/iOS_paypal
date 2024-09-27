class Student{
    var name: String
    var id: Int
    var marks: Int
    
    init(name: String, id: Int, marks: Int) {
        print("Student \(name) is getting initialized")
        self.name = name
        self.id = id
        self.marks = marks
    }
    
    deinit {
        print("Student \(name) is getting deallocated")
    }
}

var std1: Student? = Student(name: "john", id: 1, marks: 89) // strong reference ARC = 1

var std2 = std1 // strong reference ARC = 2

std1 = nil // ARC = 1

std2 = nil
