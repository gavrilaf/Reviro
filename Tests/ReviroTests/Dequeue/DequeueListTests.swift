//
//  DequeueListTests.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/17/17.
//
//

import XCTest
@testable import Reviro

class DequeueListTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDequeue() {
        let deq = DequeueList<Int>()
        
        XCTAssertNil(deq.first)
        XCTAssertNil(deq.last)
        
        deq.pushFirst(1)
        
        XCTAssertEqual(deq.first, 1)
        XCTAssertEqual(deq.last, 1)
        
        deq.pushFirst(2)
        
        XCTAssertEqual(deq.first, 2)
        XCTAssertEqual(deq.last, 1)
        
        deq.pushLast(3)
        deq.pushLast(4)
        
        XCTAssertEqual(deq.first, 2)
        XCTAssertEqual(deq.last, 4)
        
        // now dequeue should be 2 1 3 4
        XCTAssertEqual(deq.popLast(), 4)
        XCTAssertEqual(deq.popFirst(), 2)
        
        XCTAssertEqual(deq.first, 1)
        XCTAssertEqual(deq.last, 3)
        
        XCTAssertEqual(deq.popLast(), 3)
        XCTAssertEqual(deq.popFirst(), 1)
        
        XCTAssertNil(deq.first)
        XCTAssertNil(deq.last)
        
        XCTAssertTrue(deq.isEmpty)
        
        XCTAssertEqual(deq.popLast(), nil)
        XCTAssertEqual(deq.popFirst(), nil)
        
        deq.pushFirst(1)
        deq.pushFirst(2)
        
        XCTAssertEqual(deq.first, 2)
        XCTAssertEqual(deq.last, 1)
    }

    func testDequeueLong() {
        let deq = DequeueList<Int>()
        
        for i in 0..<100 {
            deq.pushFirst(i)
            deq.pushLast(i)
        }
        
        XCTAssertEqual(deq.first, 99)
        XCTAssertEqual(deq.last, 99)
        
        for _ in 0..<10 {
            deq.popFirst()
        }
        
        for _ in 0..<20 {
            deq.popLast()
        }
        
        XCTAssertEqual(deq.first, 89)
        XCTAssertEqual(deq.last, 79)
        
        deq.clear()
        
        XCTAssertNil(deq.first)
        XCTAssertTrue(deq.isEmpty)
    }
    
    func testDequeueUpdateFirst() {
        let deq = DequeueList<Int>()
        
        deq.pushLast(1)
        deq.pushLast(2)
        deq.pushLast(3)
        deq.pushLast(4)
        
        XCTAssertEqual(deq.first, 1)
        
        func update(e: inout Int?) {
            e = 5
        }
        
        deq.updateFirst(block: { (p: inout Int?) in
            p = 5
        })
        
        XCTAssertEqual(deq.first, 5)
    }
    
    func testDequeueRemoveFirst() {
        let deq = DequeueList<Int>()
        
        deq.pushLast(1)
        deq.pushLast(2)
        deq.pushLast(3)
        deq.pushLast(4)
        
        XCTAssertEqual(deq.first, 1)
        
        for i in 1...3 {
            deq.remove { (p) -> Bool in
                return p == i
            }
            
            XCTAssertEqual(deq.first, i+1)
        }
        
        deq.remove { (p) -> Bool in
            return p == 4
        }
        
        XCTAssertNil(deq.first)
        XCTAssertTrue(deq.isEmpty)
    }
    
    func testDequeueRemoveOther() {
        let deq = DequeueList<Int>()
        
        deq.pushLast(1)
        deq.pushLast(2)
        deq.pushLast(3)
        deq.pushLast(4)
        
        XCTAssertEqual(deq.first, 1)
        XCTAssertEqual(deq.last, 4)
        
        deq.remove { (p) -> Bool in return p == 2 }
        deq.remove { (p) -> Bool in return p == 3 }
        
        XCTAssertEqual(deq.first, 1)
        XCTAssertEqual(deq.last, 4)
        
        deq.remove { (p) -> Bool in return p == 4 }
        
        XCTAssertEqual(deq.first, 1)
        XCTAssertEqual(deq.last, 1)
        
        deq.remove { (p) -> Bool in return p == 1 }
        
        XCTAssertNil(deq.first)
        XCTAssertTrue(deq.isEmpty)
    }
    
    
    /**/

}
