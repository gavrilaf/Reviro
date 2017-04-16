//
//  ShellSort.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/6/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

struct ShellSort {
    
    static func sort<E>(array: inout [E], cmp: (E, E) -> Bool) {
        sort(array: &array, gaps: Gaps.Tokuda, cmp: cmp)
    }
    
    // MARK: Helpers
    
    struct Gaps {
        static let Ciura = [701, 301, 132, 57, 23, 10, 4, 1]
        static let Tokuda = [30301, 13466, 5985, 2660, 1182, 525, 103, 46, 20, 9, 4, 1]
    }
    
    static func sort<E>(array: inout [E],  gaps: [Int], cmp: (E, E) -> Bool) {
        let count = array.count
        
        array.withUnsafeMutableBufferPointer { (buf) in
            gaps.forEach { (gap) in
                if gap < count {
                    for i in gap..<count {
                        let t = buf[i]
                        
                        var j = i
                        while j >= gap && cmp(t, buf[j - gap]) {
                            buf[j] = buf[j - gap]
                            j -= gap
                        }
                        buf[j] = t
                    }
                }
            }
        }
    }
    
    static func sort<E>(array: inout [E], left: Int, right: Int, gaps: [Int], cmp: (E, E) -> Bool) {
        array.withUnsafeMutableBufferPointer { (buf) in
            gaps.forEach { (gap) in
                if left + gap < right {
                    for i in (left + gap)..<right {
                        let t = buf[i]
                        
                        var j = i
                        while j >= gap+left && cmp(t, buf[j - gap]) {
                            buf[j] = buf[j - gap]
                            j -= gap
                        }
                        buf[j] = t
                    }
                }
            }
        }
    }
}
