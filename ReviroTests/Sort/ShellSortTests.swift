//
//  ShellSortTests.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/7/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
@testable import Reviro

class ShellSortTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShellSort() {
        var a = [100, 3, 5, 45, 90, 23, 223, 8791, 334]
        
        ShellSort.sort(array: &a, cmp: { $0 < $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a, cmp: { $0 < $1 }))
        
        ShellSort.sort(array: &a, cmp: { $0 > $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a, cmp: { $0 > $1 }))
        
        var one = [1]
        ShellSort.sort(array: &one, cmp: { $0 > $1 })
        XCTAssertEqual(one.count,  1)
        XCTAssertEqual(one[0],  1)
        
        var two = [2, 1]
        ShellSort.sort(array: &two, cmp: { $0 > $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a, cmp: { $0 > $1 }))
        
        var empty = [String]()
        ShellSort.sort(array: &empty, cmp: { $0 > $1 })
        XCTAssertEqual(empty.count,  0)
    }

    func testRandomArrayHeapSort() {
        var a = randomArray(size: 100)
        
        ShellSort.sort(array: &a, cmp: { $0 < $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a, cmp: { $0 <= $1 }))
    }
    
    
    func testStringArrayHeapSort() {
        var a = ["aa", "xx", "z", "v", "vkrfkrpkfrfkr", "mama"]
        
        ShellSort.sort(array: &a, cmp: { $0 > $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a, cmp: { $0 >= $1 }))
    }

    func testShellWithRangeSort() {
        var a = [100, 90, 12, 8, 23, 1, 23, 8791, 334]
        
        ShellSort.sort(array: &a, left: 1, right: a.count-2, gaps: [4, 1], cmp: { $0 < $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a[1..<a.count-2], cmp: { $0 <= $1 }))
        
        ShellSort.sort(array: &a, left: 0, right: 6, gaps: [4, 1], cmp: { $0 < $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a[0..<6], cmp: { $0 <= $1 }))
        
        ShellSort.sort(array: &a, left: 0, right: a.count, gaps: [4, 1], cmp: { $0 < $1 })
        XCTAssertTrue(isSequenceOrdered(seq: a, cmp: { $0 <= $1 }))
    }
    

}
