// class - reference types, Inheritance can be done
// default init - available if all properties are initialized
class Student{
    // instance properties
    var name: String
    var rollNo: Int
    var marks: Int
  
    init(name: String, id: Int, marks: Int = 0) {
        self.name = name
        self.rollNo = id
        self.marks = marks
    }
    // methods - instance
    
    func display(){
        print("Name: \(name)")
        print("Roll: \(rollNo)")
        print("Marks: \(marks)")
    }
    
}
// ARC- Automatic Reference Counting
let std1 = Student(name: "john", id: 1)
let std2 = std1 // reference copied
let std3 = Student(name: "robert", id: 2)

// === - identity operator
if std1 === std3 {
    print("they are referencing same object")
} else {
    print("they are referencing Different object")
}

std2.name = "merry"

std1.display()
std2.display()

// Structure - value type, inheritance cannot be done
// structure - memberwise initializer available
// default init - available if all properties are initialized
struct Person {
    
    // properties
    var name: String = ""
    var age: Int = 10
    var city: String
    
    init(name: String, age: Int, city: String) {
        print("Person \(name) initialized")
        self.name = name.uppercased()
        self.age = age
        self.city = city
    }
    
    // methods
    func display(){
        print("Name: \(name)")
        print("Age: \(age)")
        print("City: \(city)")
    }
}

let p1 = Person(name: "john", age: 20, city: "Pune")


var p2 = p1 // p1 values copied into p2
p2.name = "merry"

p1.display()
p2.display()


