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
        let hnkButtonTapped = app.buttons["HNK"]
        hnkButtonTapped.tap()
        app.statusBars.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
    }
}
