//
//  SortPerformance.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/7/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
@testable import Reviro

class SortPerformance: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

  

    func testPerformanceHeapSortBig() {
        var arr = randomArray(size: 1000000)
        
        // This is an example of a performance test case.
        self.measure {
            HeapSort.sort(array: &arr, cmp: { $0 < $1 })
        }
    }

    func testPerformanceShellSortBig() {
        var arr = randomArray(size: 1000000)
        
        // This is an example of a performance test case.
        self.measure {
            ShellSort.sort(array: &arr, cmp: { $0 < $1 })
        }
    }
    
    func testPerformanceMergeSortBig() {
        var arr = randomArray(size: 1000000)
        
        // This is an example of a performance test case.
        self.measure {
            MergeSort.sort(array: &arr, cmp: { $0 < $1 })
        }
    }
    
    
    func testPerformanceHeapSortSmall() {
        var arr = randomArray(size: 3000)
        
        // This is an example of a performance test case.
        self.measure {
            HeapSort.sort(array: &arr, cmp: { $0 < $1 })
        }
    }
    
    func testPerformanceShellSortSmall() {
        var arr = randomArray(size: 3000)
        
        // This is an example of a performance test case.
        self.measure {
            ShellSort.sort(array: &arr, cmp: { $0 < $1 })
        }
    }
    
    func testPerformanceMergerSortSmall() {
        var arr = randomArray(size: 3000)
        
        // This is an example of a performance test case.
        self.measure {
            MergeSort.sort(array: &arr, cmp: { $0 < $1 })
        }
    }
    
}
