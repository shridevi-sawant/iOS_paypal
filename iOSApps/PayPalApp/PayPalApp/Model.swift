//
//  Model.swift
//  PayPalApp
//
//  Created by Shridevi Sawant on 09/10/24.
//

import Foundation

struct MathUtility{
    
    func add(a: Int, b:Int) -> Int {
        return a + b
    }
    
    func subtract(a: Int, b:Int) -> Int {
        return a - b
    }
    
    func multiply(a: Int, b:Int) -> Int {
        return a * b
    }
    
    func divide(a: Int, b:Int) throws -> Int {
        guard b != 0 else {
            throw MathError.divisionByZero
        }
        return a / b
    }
}

enum MathError: Error {
    case divisionByZero
    case invalidArgs
    
}
