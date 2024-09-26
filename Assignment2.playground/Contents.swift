
/*
 Assignment
 
 create structure - BankAccount
    - balance
    - name
    - account number
    - branch
 
 - displayInfo()
 - credit(amount) -> Bool
 - debit(amount) -> Bool
 
 
 via extension
    add property - interest rate- Double
    add method - getInterest(duration) -> Double
 */

struct BankAccount {
    var balance: Int
    var name: String
    let accNumber: Int
    var branch: String
    
    func displayInfo(){
        print("Account number: \(accNumber)")
        print("Balance: \(balance)")
    }
    
    mutating func credit(amount: Int) -> Bool {
        self.balance += amount
        return true
    }
    
    mutating func debit(amount: Int) -> Bool {
        guard amount < balance else {
            return false
        }
        
        self.balance -= amount
        return true
    }
}

extension BankAccount {
    var interestRate: Double {
        8.5
    }
    
    func calculateInterest(duration: Int) -> Double{
        return interestRate * Double(self.balance) * Double(duration)
    }
}


var acc1 = BankAccount(balance: 0, name: "john", accNumber: 1, branch: "Bangalore")

acc1.credit(amount: 100)
print(acc1.calculateInterest(duration: 12))

