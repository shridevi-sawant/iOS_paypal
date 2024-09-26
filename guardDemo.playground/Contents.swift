import UIKit

var greeting = "Hello, playground"

/* remove spaces from string */

/* using while */

while greeting.contains(" ") {
    let idx = greeting.firstIndex(of: " ")! // ! - forceful unwrapping
    
    greeting.remove(at: idx)
}

print(greeting)

greeting = "Hello, playground"

/* using for */
var result = ""
for ch in greeting {
    if ch != " " {
        result.append(ch)
    }
}

print(result)

/* using guard */
/* guard - similar to if, mandatory else
early -exit statement
 */

result = ""
for ch in greeting {
//    if ch != " " {
//        result.append(ch)
//    }
    
    guard ch != " " else {
        print("space found")
        continue
    }
    
    result.append(ch)
}

let names = ["john", "", "merry", "", "robert"]

// uppercase the names if name is not empty

for name in names {
    
    guard !name.isEmpty else {
        print("Empty name found")
        continue
    }
    
    print("Name: \(name.uppercased())")
}

/*
 print all prime numbers between 2 to 20 using guard
 */

for num in 2...20 {
    var isPrime = true
    for divisor in 2..<num {
        guard num % divisor != 0 else {
            isPrime = false
            break
        }
    }
    
    if isPrime {
        print("\(num) is prime")
    }
}
