
// default arguments
// place them after mandatory, if more than one dont skip the label
func calculateEMI(amount: Int, rate: Int = 10, duration : Int = 12){
    print("Amount: \(amount)")
    print("Rate: \(rate)")
    print("Duration: \(duration)")
    
    // emi calculation..
}

calculateEMI(amount: 1000)
calculateEMI(amount: 1000, rate: 20)
calculateEMI(amount: 1000, duration: 24)

// variadic arguments
// multiple allowed with label
func doSum(_ numbers: Int..., divisors: Int...) -> Int{
    var result = 0
    for num in numbers{
        result += num
    }
    return result
}

print(doSum(1,2,30,10, divisors: 2,3))
print(doSum())

///

func swap(a: inout Int, b: inout Int){
    var temp = a
    a = b
    b = temp
}

var num1 = 10
var num2 = 20

swap(a: &num1, b: &num2)
print("num1 = \(num1)")
print("num2 = \(num2)")

/*
 Assignment
 - Write 
 */
