
/*
 Assignment
 
 create class - BankAccount
    - balance
    - name
    - account number
    - branch
 
 - displayInfo()
 -
 
 
 protocol CreditProtocol
    - maxAmountForCredit
    - credit(amount) -> Bool
 
 protocol DebitProtocol
    - maxAmountForDebit
    - debit(amount) -> Bool
 
 
 create class SavingAccount : BankAccount, CreditProtocol, DebitProtocol
    - credit()
    - debit()
 
 create class FDAccount: BankAccount, CreditProtocol
    - credit()
 */

class BankAccount {
    var balance: Int = 0
    var name: String
    let accNumber: Int
    var branch: String
    
    init(name: String, accNumber: Int, branch: String) {
    
        self.name = name
        self.accNumber = accNumber
        self.branch = branch
    }
    
    func displayInfo(){
        print("Account number: \(accNumber)")
        print("Balance: \(balance)")
    }
}

protocol CreditProtocol {
    var maxAmountForCredit: Int {get}
    
    func credit(amount: Int) -> Bool
}

protocol DebitProtocol {
    var maxAmountForDebit: Int {get}
    func debit(amount: Int) -> Bool
}

class SavingAccount:BankAccount, CreditProtocol {
    let maxAmountForCredit: Int = 1_00_000
    
    
    func credit(amount: Int) -> Bool {

        
        guard amount > 0 && amount < maxAmountForCredit else {
            return false
        }
        
        self.balance += amount
        return true
    }
    
    
}

// conforming to protocol via extension
extension SavingAccount: DebitProtocol{
    var maxAmountForDebit: Int {
        1_00_000
    }
    
    func debit(amount: Int) -> Bool {
        guard balance > amount && amount < maxAmountForDebit else {
            return false
        }
        
        balance -= amount
        return true
    }
    
    
}

class FDAccount: BankAccount, CreditProtocol {
    var maxAmountForCredit: Int = 10_000_000
    static var maxNoOfCredits = 2
    var countOfCredit = 0
    
    func credit(amount: Int) -> Bool {
        
        guard amount > 0 && amount < maxAmountForCredit && countOfCredit < FDAccount.maxNoOfCredits else {
            return false
        }
        
        self.balance += amount
        countOfCredit += 1
        return true
    }
    
    
}

let sAccount = SavingAccount(name: "John", accNumber: 1, branch: "blr")
let fdAccount = FDAccount(name: "Merry", accNumber: 2, branch: "blr")
let account = BankAccount(name: "Tom", accNumber: 3, branch: "blr")

if sAccount.credit(amount: 1000){
    print("Amount credited: balance:\(sAccount.balance)")
}
else {
    print("Error crediting amount")
}

if sAccount.debit(amount: 100000) {
    print("Amount debitted: balance \(sAccount.balance)")
}
else {
    print("Invalid withdrawl")
}

fdAccount.credit(amount: 1000)

let accounts = [fdAccount, sAccount, account]

for acc in accounts {
    
    if acc is DebitProtocol {
        if (acc as! DebitProtocol).debit(amount: 10) {
            print("Debitted")
        }
        else {
            print("Invalid debit from  acc:\(acc.accNumber)")
        }
        
    }
    else {
        print("Cannot be debited")
    }
}

