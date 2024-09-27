
struct Student: CustomStringConvertible, Equatable {
    
    static func % (lhs: Student, total: Int) -> Double {
        return Double(lhs.marks) / Double(total) * 100
    }
    
    static func + (lhs: Student, rhs: Student) -> Student{
        return Student(name: "\(lhs.name) \(rhs.name)", rollNo: 100, marks: 782)
    }
    
    // operator overloading
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.marks == rhs.marks
    }
    
    var description: String {
        return "Student \(name) with roll No \(rollNo) has obtained \(marks) marks"
    }
    
    var name: String
    var rollNo: Int
    var marks: Int
}

extension Student: Comparable {
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.marks < rhs.marks
    }
    
    static func > (lhs: Student, rhs: Student) -> Bool {
        return lhs.marks > rhs.marks
    }
    
    
}

var std1 = Student(name: "john", rollNo: 1, marks: 420)
print(std1)

let std2 = Student(name: "merry", rollNo: 2, marks: 523)

if std1 == std2 {
    print("they are equal")
}
else {
    print("they are diff")
}

if std1 > std2 {
    print("\(std1.name) has more marks than \(std2.name)")
}
else {
    print("\(std2.name) has more marks than \(std1.name)")
}

std1 + std2

std1 % 800
