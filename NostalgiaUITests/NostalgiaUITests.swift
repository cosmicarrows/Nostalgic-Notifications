//
//  NostalgiaUITests.swift
//  NostalgiaUITests
//
//  Created by Laurence Wingo on 6/9/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import XCTest

class NostalgiaUITests: XCTestCase {
        
    override func setUp() {
       let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.textFields["It's on the business card"].tap()
        
        let buzzMeInButton = app.buttons["BUZZ ME IN"]
        buzzMeInButton.tap()
        snapshot("01Fly")
        buzzMeInButton.tap()
        buzzMeInButton.tap()
        app.buttons["APPROACH LAURENCE"].tap()
        snapshot("02Fly")
        app.alerts["Uh oh! He's headed out!"].buttons["Let's Show Him You Mean Business"].tap()
        snapshot("03Fly")
        
                
    }
    
}
