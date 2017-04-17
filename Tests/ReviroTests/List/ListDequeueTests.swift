//
//  ListDequeueTests.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/17/17.
//
//

import XCTest
@testable import Reviro

class ListDequeueTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDequeue() {
        let deq = LinkedList<Int>()
        
        XCTAssertNil(deq.first)
        XCTAssertNil(deq.last)
        
        
    }

    

}
