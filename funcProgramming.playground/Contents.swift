

// function type (Int, Int) -> Int
func add(a: Int, b: Int) -> Int {
    return a + b
}


// (Int) -> Int
func square(num: Int) -> Int {
    return num * num
}

var mathFunction : (Int, Int) -> Int

mathFunction = add

var result = mathFunction(10, 20)
print(result)

// higher order function - function as parameter or return value

func doOperation(arg1: Int, arg2: Int, _ operation: (Int, Int)-> Int ){
    
    var result = operation(arg1, arg2)
    print("RESULT: \(result)")
}

doOperation(arg1: 10, arg2: 20, add)

// nested functions

func makeZero(num: Int) -> ()-> Int {
    
    func increment() -> Int {
        return num + 1
    }
    
    func decrement() -> Int {
        return num - 1
    }
    
    return num > 0 ? decrement : increment
}

var number = -5

while number != 0 {
    //number = makeZero(num: number)()
    let operation = makeZero(num: number)
    number = operation()
    print("Number : \(number)")
}
