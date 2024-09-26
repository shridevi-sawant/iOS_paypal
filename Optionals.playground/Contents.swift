import Foundation

var city: String? = "Bangalore" // Optional

// unwrapping an optional

// option 1 - forceful unwrap - !
city = nil


if city != nil {
    print("City: \(city!)")
}
else {
    print("City not available")
}

// Option2 - optional binding

// if let
city = nil
if let myCity = city {
    print("City : \(myCity.uppercased())")
}
else {
    print("City not available ")
}

// guard let
city = "Bangalore"
guard let location = city else {
    print("City is not available")
    exit(-1)
}

print(location)

// option 3 - nil-coalescing ?? - convert optional to non-optional
city = nil
let myCity = city ?? "London"

print("City: \(myCity)")

// optional chaining ?.
city = "Pune"

if let length = city?.uppercased().count {
    print("Char count: \(length)")
}


var data = ["john", "merry", nil, "robert", nil]


/*
 1. print first char of each name
 2. print last char of each name
 
 */

for name in data {
    
    let lastCh = name?.last?.uppercased()
    print("Last char: \(lastCh ?? "-")")
    
    guard let n = name else {
        continue
    }
    
    print("First: \(n.first ?? " ")")
}

// create dictionary <String, Int?>

var places : Dictionary<String, Int?> = [:]

// populate
places["Jayanagar"] = 560011
places["Mumbai"] = nil
places["JP Nagar"] = 560078
places["pune"] = nil

print(places)



// iterate, print pincode if available

for (place, pincode) in places {
    
    print("Pincode for \(place): \(pincode!)")
    
}

var data1: [Any] = ["", 10, 23.45]

// type check operator - is
// type casting - as

var strArray: [String] = []
var intArray: [Int] = []

for element in data1 {
    
    if element is String {
        strArray.append(element as! String)
    }
}
