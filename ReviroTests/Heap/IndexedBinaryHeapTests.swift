//
//  IndexedBinaryHeapTests.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/16/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
@testable import Reviro

class IndexedBinaryHeapTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIndex() {
        let a = [1, 90, 3, 45, 23, 8, 234, 589, 234, 12, 34, 90, 11, 11, 11, 23, 56]
        let pq = BinaryHeap(array: a, sort: { return $0 < $1 })
        
        XCTAssertNotNil(pq.index(of: 589))
        XCTAssertNotNil(pq.index(of: 1))
        XCTAssertNotNil(pq.index(of: 234))
        XCTAssertNotNil(pq.index(of: 11))
        XCTAssertNotNil(pq.index(of: 56))
        XCTAssertNotNil(pq.index(of: 234))
        
        XCTAssertNil(pq.index(of: 120))
        XCTAssertNil(pq.index(of: 1000))
        XCTAssertNil(pq.index(of: -10))
        
    }

}
