//
//  SimpleCalcUITests.swift
//  SimpleCalcUITests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

class SimpleCalcUITests: XCTestCase {
    var app: XCUIApplication!
 
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
       
    }

    func testCalul(){
        app.buttons["1"].tap()
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["x"].tap()
        app.buttons["7"].tap()
        app.buttons["="].tap()
        let txt = app.textViews["15 + 3 x 7 = 36.0"]
        
        XCTAssertTrue(txt.exists, "Result incorrect")
    }
    
    func testCalculError(){
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["+"].tap()
        
        XCTAssertTrue(app.alerts.buttons["OK"].exists, "Alert not display")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
