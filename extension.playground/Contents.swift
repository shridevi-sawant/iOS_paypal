
extension String {
    
    var spaceCount: Int {
        var counter = 0
        for ch in self {
            if ch == " " {
                counter += 1
            }
        }
        
        return counter
    }
}

let msg = "Hi How are you"
msg.spaceCount

