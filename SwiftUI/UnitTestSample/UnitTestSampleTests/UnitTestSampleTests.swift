//
//  UnitTestSampleTests.swift
//  UnitTestSampleTests
//
//  Created by home on 17/08/22.
//

import XCTest
//import Nimble
@testable import UnitTestSample

class UnitTestSampleTests: XCTestCase {

    func testAdd(){
        let math = MathStuff()
        
        let result = math.sumStuff(x: 1, y: 2)
        XCTAssertEqual(result, 3,"add failed")
    }
    func testMultiply(){
        let math = MathStuff()
        
        let result = math.multiplyStuff(x: 1, y: 2)
        XCTAssertEqual(result, 2)
    }
    func testDivide(){
        let math = MathStuff()
        
        let result = math.divideStuff(x: 2, y: 2)
        XCTAssertEqual(result, 1)
    }

}
