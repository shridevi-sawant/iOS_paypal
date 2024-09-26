
protocol ProtocolA {
    // property requirements
    var name: String {get set}
    var age:Int {get}
    
    // method requirements
    func methodA() -> Int
    
}

struct Person: ProtocolA {
    func methodA() -> Int {
        return 10
    }
    
    var name: String
    
    let age: Int
    
    
}

struct Animal: ProtocolA {
    func methodA() -> Int {
        return 30
    }
    
    
    var name: String
    var type: String
    
    var age: Int {
        get {
             10
        }
        set (newAge) {
            switch (newAge){
            case 0...10:
                type = "infant"
            case 10...30:
                type = "young"
            default:
                type = "adult"
            }
        }
    }
}
