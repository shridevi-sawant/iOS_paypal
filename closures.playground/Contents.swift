
func doOperation(arg1: Int, arg2: Int, _ operation: (Int, Int)-> Int ){
    
    var result = operation(arg1, arg2)
    print("RESULT: \(result)")
}

// full syntax closure
doOperation(arg1: 20, arg2: 10, { (a: Int, b: Int) -> Int in
    print("doing subtraction ")
    return a - b
})


doOperation(arg1: 10, arg2: 2, { (a, b) in
    print("doing multiplication")
    return a * b
})

// traliling closure

doOperation(arg1: 10, arg2: 2) { a, b in
    print("doing division")
    return a / b
}

let numbers = [1,2,3,4,5,6,7,8,9,10]

// get even numbers
let evenNumbers = numbers.filter { num in
    num % 2 == 0
}

// square of all numbers
let squares = numbers.map { num in
    num * num
}

// cumulative product
let cumProd = numbers.reduce(1) { res, num in
    res * num
}

print("Cumulative Product: \(cumProd)")


let data = ["1234567890", "123", "9876543210", "890"]
/*
 1. valid phone numbers - 10 digits
 
 
 */

let names = ["john", "elizabeth", "robert", "tom"]
// lengthiest name

let lengthiest = names.reduce("") { result, name in
    result.count > name.count ? result : name
}
