
struct Person {
    
    // stored property
    var firstName: String
    var lastName: String
    
    // computed property - always var
    var fullName: String {
        get {
            print("get block for fullName")
            return "\(firstName) \(lastName)"
        }
        
        set(newName) {
            print("Setting new fullname")
            let splits = newName.split(separator: " ")
            firstName = String(splits[0])
            lastName = String(splits[1])
        }
    }
}

var p1 = Person(firstName: "john", lastName: "smith")
print(p1.fullName)

p1.fullName = "merry rose"
print(p1.fullName)

struct University {
    var name: String
    var website: String
    
    init(name: String, website: String) {
        print("Univ \(name) initialized")
        self.name = name
        self.website = website
    }
}

struct Student {
    var name: String
    var marks: Int
    lazy var institute: University = University(name: "IIT Roorkee", website: "www.iitr.com")
    
    static let outOf = 600
    
    // read-only computed property
    var percentage: Double {
        return Double(marks) / Double(Student.outOf) * 100
    }
}


var std1 = Student(name: "max", marks: 550)

print("Percentage: \(std1.percentage)")

std1.institute
