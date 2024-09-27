
enum MathError : Error {
    case divisionByZero
    case invalidArgs
    
}

// throwing function
func doDivision(number: Int, divisor: Int) throws -> Double {
    
    guard divisor != 0 else {
        throw MathError.divisionByZero
    }
    
    let result = Double(number) / Double(divisor)
    return result
}



/*
 Error handling
 1. propogate error
 2. do -catch
 3. convert error into optional
 4. skip error handling
 */

// do -catch


do {
    let result = try doDivision(number: 10, divisor: 0)
    print("Division = \(result)")
}
catch MathError.divisionByZero {
    print("Division by zero = infinity")
}
catch {
    print("Error \(error)")
}

// converting error into optional - type of error is not known

if let result = try? doDivision(number: 10, divisor: 0){
    print("Result = \(result)")
}
else {
    print("Error doing division")
}

// skipping error handling

func divideByTwo(num: Int) -> Double{
    
   return try! doDivision(number: num, divisor: 2)
}

divideByTwo(num: 10)

// propogating error

func divisionWithRemainder(number: Int, divisor: Int) throws{
    
    let division = try doDivision(number: number, divisor: divisor)
    
    let remainder = number % divisor
    
    print("Division: \(division), Remainder: \(remainder)")
}

do {
    try divisionWithRemainder(number: 100, divisor: 0)
}catch {
    print("ERROR: \(error)")
}
