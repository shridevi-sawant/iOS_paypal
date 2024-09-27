// enum - value type

enum Color {
    case white
    case blue, red, green, black
    
    // computed property
    
    var transparancy: Int {
        switch (self){
        case .black:
            return 0x000
        case .white:
            return 0x001
        case .blue:
            return 0x002
        case .red:
            return 0x003
        case .green:
            return 0x004
        }
    }
    
    // methods
    
    func toRGB() -> Int {
        switch(self){
            
        case .white:
            return 0xfff
        case .blue:
            return 0x00f
        case .red:
            return 0xf00
        case .green:
            return 0x0f0
        case .black:
            return 0x000
        }
    }
    
}

var bgColor = Color.blue

bgColor = Color.green
print(bgColor)

print(bgColor.toRGB())
print(bgColor.transparancy)


// associated values
enum PaymentMethod {
    case upi(String)
    case cash
    case creditCard(String, String, Int)
}

func doPayment(amount: Int, method: PaymentMethod){
    
    switch method {
        
    case .upi(let upiID):
        print("Payment by UPI with id \(upiID)")
    case .cash:
        print("Paying \(amount) by cash")
    case .creditCard(let cardNo, let expiry, let cvv):
        print("Paying with credit card \(cardNo)")
    }
}

doPayment(amount: 1000, method: .upi("demo@okicici"))

// enum with Raw Value - Int, char, String, floating num

enum Direction: Int {
    case east = 10
    case west
    case north, south
}

var plotDirection = Direction.south
print(plotDirection.rawValue)

// enum with raw value as string

enum Airport: String, CustomStringConvertible {
    var description: String {
        return "Airport \(self), code: \(self.rawValue)"
    }
    
    case bangalore = "BLR"
    case newYork = "JFK"
    case london
    case delhi = "DLH"
}

var destination = Airport.london

print("Destination Airport: \(destination.rawValue)")

var source = destination
//print(source)
print("----")
