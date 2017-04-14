//
//  OrderCheckerTests.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/1/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
@testable import Reviro

class OrderCheckerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStreamOrderChecker() {
        let ordered = [1, 23, 45, 78, 98]
        let unordered = [45, 1, 23, 45, 78, 98]
        
        var checker = StreamOrderChecker<Int>(cmp: { $0 < $1 })
        
        ordered.forEach { checker.checkNext($0) }
        XCTAssertTrue(checker.isOrdered)
        
        checker.reset()
        
        unordered.forEach { checker.checkNext($0) }
        XCTAssertFalse(checker.isOrdered)
    }
}
