//
//  MathUtilityTest.swift
//  PayPalAppTests
//
//  Created by Shridevi Sawant on 09/10/24.
//

import XCTest
@testable import PayPalApp

final class MathUtilityTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd(){
        let mUtility = MathUtility()
        // with test data
        let arg1 = 10
        let arg2 = 20
        // perform
        
        let result = mUtility.add(a: arg1, b: arg2)
        
        // verify
        XCTAssertEqual(result, 30, "add result to be 40")
        
    }
    
    func testDivide() throws {
        let mUtility = MathUtility()
        // with test data
        let arg1 = 10
        let arg2 = 2
        // perform
        
        let result = try mUtility.divide(a: arg1, b: arg2)
        
        // verify
        XCTAssertEqual(result, 5)
    }
    
    func testDivideByZero() throws{
        let mUtility = MathUtility()
        // with test data
        let arg1 = 10
        let arg2 = 0
        // perform
        
    
        
        // verify
        XCTAssertThrowsError(try mUtility.divide(a: arg1, b: arg2))
    }

}
