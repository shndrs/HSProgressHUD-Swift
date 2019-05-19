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

    override func tearDown() {
        
    }

    func testExample() {
        
        let bg5Element = XCUIApplication().otherElements.containing(.image, identifier:"bg5").element
        bg5Element.tap()
    }
}
