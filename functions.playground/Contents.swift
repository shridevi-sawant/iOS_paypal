
func add(a: Int, b: Int) {
    let result = a + b
    print("\(a) + \(b) = \(result)")
    return
}

func add(a: Double, b: Double){
    let result = a + b
    print("\(a) + \(b) = \(result)")
    return
}

func display(_ str: String, from region: String) -> Void {
    print("Message: \(str.uppercased())")
    print("From: \(region)")
}

add(a: 10, b: 20)
add(a: 12.3, b: 10.0)


display("Hello", from: "UK")

func getMinMax(numbers: [Int]) -> (maxNum: Int, minNum : Int) {
    guard !numbers.isEmpty else {
        return (0, 0)
    }
    
    var max = numbers[0]
    var min = numbers[0]
    
    for num in numbers {
        max = max > num ? max : num
        min = min < num ? min : num
    }
    
    print("MAX: \(max), MIN: \(min)")
    
    return (max, min)
}

let info = getMinMax(numbers: [10,2,20,30,21,12, 300])

print("Max num: \(info.maxNum)")
