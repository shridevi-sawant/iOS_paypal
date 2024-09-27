class Customer{
    var name: String
    var card: CreditCard? = nil
    
    init(name: String) {
        print("\(name) customer init")
        self.name = name
    }
    
    deinit {
        print("\(name) deallocated")
    }
}

class CreditCard{
    var number: String
    unowned var owner: Customer // non-optional, ARC not incremented
    
    init(number: String, owner: Customer) {
        print("Card \(number) init")
        self.number = number
        self.owner = owner
    }
    
    deinit {
        print("Card \(number) deallocated")
    }
}

func addRelationShip(){
    var john = Customer(name: "john")
    john.card = CreditCard(number: "123", owner: john)
    
}

addRelationShip()
