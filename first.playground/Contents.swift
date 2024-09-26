import UIKit

var greeting = "Hello, playground"
greeting = "Good Morning"

print(greeting)
print("Message: \(greeting)")

let pi: Float

pi = 1.234

print("PI: \(pi)")

print("Int pi: \(Int8(pi))")

let number = 10

var x = number % 2 == 0

var grade: Character = "A"

grade = "B"

// Operators

let num1 = 10
let num2 = 2

print("\(num1) + \(num2) = \(num1 + num2)")
print(num1, terminator: "\t")
print(num2)

print("remainder: \(num1 % num2)")

// ranges - closed range ...
// half-open range ..<

let singleDigitRange = 1..<10
singleDigitRange.lowerBound
singleDigitRange.upperBound


for i in singleDigitRange {
    print("Square of \(i): \(i * i)")
}

let alphaRange: ClosedRange<Character>  = "A"..."Z"
let char:Character = "9"

if alphaRange.contains(char) {
    print("\(char) is alphabet")
}
else {
    print("\(char) is NOT alphabet")
}

// optional - null safety

var name: String? = "PayPal" // optional
print(name ?? "demo")

// optional unwrapping - ?? nil coalescing

