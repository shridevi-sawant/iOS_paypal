
 class Employee {
    
    var name: String
    let empId: Int
    var salary: Int
    
    // type property
    static var empCount: Int = 0
    
    init(name: String, empId: Int, salary: Int = 1000) {
        self.name = name
        self.empId = empId
        self.salary = salary
        
        Employee.empCount += 1
    }
    
    static func displayCount(){
        print("Total Employees: \(empCount)")
    }
    
    func displayInfo(){
        print("Name: \(name)")
        print("EMP Id: \(empId)")
        print("Salary: \(salary)")
    }
}

// subclass - uses init of parent if not supplied
 class Developer: Employee{
    
    var skill : String
    
    init(name: String, empId: Int, salary: Int = 1000, skill: String) {
        
        self.skill = skill
        super.init(name: name, empId: empId, salary: salary)
    }
    
    override func displayInfo() {
        print("----Developer------")
        super.displayInfo()
        print("Skill: \(skill)")
    }
}


let dev1 = Developer(name: "merry", empId: 2, salary: 2000, skill: "Swift")
let emp1 = Employee(name: "john", empId: 1)


let dev2 = Developer(name: "robert", empId: 3, salary: 4000, skill: "Kotlin")
let emp2 = Employee(name: "terry", empId: 4)

let empList = [emp1, dev1, emp2, dev2]


for emp in empList {
    
//    if emp is Developer {
//        print("Developer with below skill")
//        print((emp as! Developer).skill)
//        print("-----------")
//    }
    
    if let dev = emp as? Developer{
        print("Developer with below skill")
        print(dev.skill)
        print("-----------")
    }
    else {
        // not a developer
    }
    
    
}

var msg : Dictionary<String, Any> = [:]

msg["tweet-msg"] = "hello india"
msg["likes"] = 10
msg["isPublic"] = true

if var x = msg["likes"] as? Int {
    x += 1
    print("No of likes: \(x)")
}


extension Employee {
    
    var bonus: Int {
        200
    }
    
    func applyBonus(){
        self.salary += bonus
        print("Updated salary: \(self.salary)")
    }
}

emp1.applyBonus()
dev1.applyBonus()


