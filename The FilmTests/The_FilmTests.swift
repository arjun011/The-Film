//
//  The_FilmTests.swift
//  The FilmTests
//
//  Created by Arjun C on 05/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import XCTest
@testable import The_Film

class The_FilmTests: XCTestCase {

    override func setUp() {
        print("Setup Test")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        print("tear Down test")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testA() {
        print("test Case A")
    }
    
    func testB() {
        print("Test case B")
    }
    
    func testC() {
        print("Test case C")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
