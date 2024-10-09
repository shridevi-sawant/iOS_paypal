//
//  ContentViewTest.swift
//  PayPalAppUITests
//
//  Created by Shridevi Sawant on 09/10/24.
//

import XCTest

final class ContentViewTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    func testLayout(){
        // launch app
        
        let app = XCUIApplication()
        
        app.launch()
        
        
        if app.waitForExistence(timeout: 4){
            // start test
            let title = app.staticTexts["Hello, World!"]
            
            XCTAssertTrue(title.exists)
            
            let nameInp = app.textFields["Enter your name"]
            
            XCTAssertTrue(nameInp.exists && nameInp.isEnabled)
            
            let btn = app.buttons["NEXT"]
            
            XCTAssertTrue(btn.exists && btn.isHittable)
            
            nameInp.press(forDuration: 1)
            nameInp.typeText("demo")
            
            XCTAssertTrue(app.staticTexts["Hello, demo!"].exists)
            
            let mobileTF = app.textFields["mobile"]
            
            XCTAssertTrue(mobileTF.exists)
            
        }
        
    }
    
    func testBtnClick(){
        
        let app = XCUIApplication()
        
        app.launch()
        
        if app.waitForExistence(timeout: 4){
            
            let nameInp = app.textFields["Enter your name"]
            
            let btn = app.buttons["NEXT"]
            
            nameInp.press(forDuration: 1)
            nameInp.typeText("demo")
            
            btn.tap()
            
            XCTAssertTrue( app.staticTexts["demo"].exists) // navigation worked
            
            let screenShot = app.screenshot()
            let attachment = XCTAttachment(screenshot: screenShot)
            attachment.name = "detailScreen"
            attachment.lifetime = .keepAlways
            
            add(attachment)
        }
        
        
        
    }
    
    
    func testWithRecorder(){
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        app.launch()
        
       if app.waitForExistence(timeout: 4){
            app.textFields["Enter your name"].tap()
            
            let tKey = app.keys["T"]
            tKey.tap()
            
            
            let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            eKey.tap()
            
            
            let sKey = app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            sKey.tap()
            
            
            let tKey2 = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            tKey2.tap()
            
            app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.buttons["NEXT"].tap()
            
            XCTAssertTrue(app.staticTexts["test"].exists)
            
        }
        
        
    }
    
}

