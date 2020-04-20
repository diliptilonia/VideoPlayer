//
//  MVVMTests.swift
//  MVVMTests
//
//  Created by Dilip Gurjar on 09/04/20.
//  Copyright © 2020 Dilip Gurjar. All rights reserved.
//

import XCTest
@testable import MVVM

class MVVMTests: XCTestCase {
    
    let _manager = UserViewModel()
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func addTwoNumber() {
        let adition = _manager.addTwoNumber(num1: 4, num2: 5)
        XCTAssert(adition==9)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
