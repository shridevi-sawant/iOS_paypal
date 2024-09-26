
// Tuple - aggregated data, not a collection

typealias Record = (name: String, mobile: Int, city: String)


var data = (name:"john", mobile:9812, city:"pune")

print(data.0)
print(data.2)

data.0 = "merry"

print(data)

let rec1: Record = ("robert", 100, "london")

print("City: \(rec1.city)")

switch rec1 {
 case let (n,m,c) where c == "pune":
    print("Name: \(n), City:\(c), Mobile: \(m)")
default:
    print("\(rec1.name) not from pune")
    break
}
