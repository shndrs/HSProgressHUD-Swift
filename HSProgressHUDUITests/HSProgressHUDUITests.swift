//
//  HSProgressHUDUITests.swift
//  HSProgressHUDUITests
//
//  Created by NP2 on 5/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import XCTest

class HSProgressHUDUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {}

    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["Show Custom Indicator"].tap()
        app.otherElements.containing(.image, identifier:"bg5").element.tap()
    }
}
