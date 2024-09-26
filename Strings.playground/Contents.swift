import UIKit

var greeting = "Hello, playground"



print("First char: \(greeting[greeting.startIndex])")

let lastIdx = greeting.index(before: greeting.endIndex)

print("Last char: \(greeting[lastIdx])")

let idx_4th = greeting.index(greeting.startIndex, offsetBy: 3)

print("4th char: \(greeting[idx_4th])")

let idx_5th_last = greeting.index(greeting.endIndex, offsetBy: -5)

print("Last 5th char: \(greeting[idx_5th_last])")

for ch in greeting {

    if ch == " " {
        print("Its space")
    }
    
}

var name = "paypal"
name = name.uppercased()
print(name)

// mutability - let or var
var city = "Pune"
city.append(" India")

print(city)

var address = "Paypal Bangalore 560123"

var vowels: [Character] = ["a", "e", "i", "o", "u"]

/*
 count of vowels, count of digits
 */
var vCount = 0
var digitCount = 0
var spaceCount = 0

for ch in address.lowercased() {
//    if vowels.contains(ch) {
//        vCount += 1
//    }
//    if ch.isNumber {
//        digitCount += 1
//    }
//    
    
    switch ch {
   
    case " ":
        spaceCount += 1
    case "a", "e", "o", "u", "i":
        vCount += 1
        fallthrough
    case "a"..."z":
        print("Alphabet found \(ch) ")
        
    case let x where ch.isNumber:
        digitCount += 1
        print("Digit found \(x)")
    default:
        break
    }
}
