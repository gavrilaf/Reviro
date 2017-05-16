//
//  DequeuePerformance.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/19/17.
//
//

import XCTest
@testable import Reviro

class DequeuePerformance: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceDequeueList() {
        let deq = DequeueList<Int>()
        
        // This is an example of a performance test case.
        self.measure {
            for _ in 0..<100000 {
                for i in 0..<5 {
                    deq.pushFirst(i)
                }
                
                for i in 0..<3 {
                    deq.pushFirst(i)
                }
                
                for i in 0..<3 {
                    deq.pushFirst(i)
                }
                
                deq.popLast()
                deq.popFirst()
            }
        }
    }
    
    func testPerformanceDequeueArray() {
        let deq = DequeueArray<Int>()
        
        // This is an example of a performance test case.
        self.measure {
            for _ in 0..<1000 { // TODO: AAAAAA!!!!!! It's terrible perfomance!!!! Fucking shit!!!!
                for i in 0..<5 {
                    deq.pushFirst(i)
                }
                
                for i in 0..<3 {
                    deq.pushFirst(i)
                }
                
                for i in 0..<3 {
                    deq.pushFirst(i)
                }
                
                deq.popLast()
                deq.popFirst()
            }
        }
    }

    
}
