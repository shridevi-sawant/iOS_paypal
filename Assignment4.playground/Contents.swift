
/*
 
 /*
  Error handling
  1. propogate error
  2. do -catch
  3. convert error into optional
  4. skip error handling
  */
 */

enum ConversionError : Error {
    case noValueError
    case invalidArgError
}

func convertStr(str: String?, conversion: (String) -> String) throws -> String{
    // throw error if str is nil
    // if not nil execute the conversion
    
    guard str != nil else {
        throw ConversionError.noValueError
    }
    
    guard !str!.isEmpty else {
        throw ConversionError.invalidArgError
    }
    
    return conversion(str!)
}

// propogating error
func makeLowerCase(name: String?) throws  {
    
   let result = try convertStr(str: name) { inp in
        inp.lowercased()
    }
    
    print("Lowercased : \(result)")
}

func makeUpperCase(name: String?) {
    do {
        let result = try convertStr(str: name) { inp in
            inp.uppercased()
        }
        
    }catch {
        
    }
}

func removeSpaces(name: String?) {
    guard let newName = name else {
        return
    }
    let result = try! convertStr(str: newName) { inp in
       var removed = ""
        for ch in inp {
            if ch != " " {
                removed.append(ch)
            }
        }
        
        return removed
    }
    
}

func vowelsOnly(name: String?){
    let vowels: [Character] = ["a","e", "o","u","i"]
    
  let vowelsFound = try? convertStr(str: name) { inp in
        var result = ""
        for ch in inp {
            if vowels.contains(ch){
                result.append(ch)
            }
        }
        return result
    }
    
    
    
    print("Vowels: \(vowelsFound ?? "No vowels found" )")
}
