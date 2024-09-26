
// Array

var names: [String] = [] // Array literal

names.append("john")

names += ["merry", "robert"]

print(names)

names[2] = "john"

print(names)

var numbers = Array(repeating: 1, count: 3)
print(numbers)

print("Capacity : \(numbers.capacity)")
for i in 1...10 {
    numbers.append(i)
    print("Capacity: \(numbers.capacity)")
}

print(numbers)

// Set

var evenNumbers: Set = [2,4,6,8, 2]

print(evenNumbers)

var oddNumbers: Set<Int> = []

for i in stride(from: 1, to: 10, by: 2){
    oddNumbers.insert(i)
}
print(oddNumbers)

// dictionary

var contacts: Dictionary<String, Int> = [:]

contacts["john"] = 100
contacts["merry"] = 200

print(contacts)

for (name, number) in contacts {
    print("Name: \(name), No: \(number)")
}

for contact in contacts {
    print("Name: \(contact.key), No: \(contact.value)")
}


let str = "1asrt"
let x = Int(str)


