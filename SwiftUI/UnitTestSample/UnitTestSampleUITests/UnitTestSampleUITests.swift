//
//  UnitTestSampleUITests.swift
//  UnitTestSampleUITests
//
//  Created by home on 17/08/22.
//

import XCTest

class UnitTestSampleUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
      
        let app = XCUIApplication()
        app.launch()
        
        let txtField = app.textFields["username"]
        XCTAssertTrue(txtField.exists)

        txtField.tap()
        txtField.typeText("ramonfel")
        //assert(txtField.exists)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        assert(passwordSecureTextField.exists)
        
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
       
        app.buttons["Continue"].tap()
        
        let validText = app.staticTexts["Welcome"]
        assert(validText.exists)
                
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
   // }
}
