class University {
    var name: String
    weak var topper: Student? = nil // weak - ARC not incremented, always var and optional
    
    init (name: String) {
        self.name = name
        print("Univ \(name) is initialized")
    }
    
    deinit {
        print("Univ \(name) is getting deallocated")
    }
}


class Student{
    var name: String
    var id: Int
    var marks: Int
    var institute: University? = nil
    
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

func setup () {
    var std1: Student? = Student(name: "john", id: 1, marks: 89) // strong reference
    
    var univ: University? = University(name: "IIT Roorkee")
    
    
    std1?.institute = univ
    univ?.topper = std1 // ARC = 1
    
}

setup()
