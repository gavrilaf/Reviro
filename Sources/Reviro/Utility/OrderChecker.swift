//
//  StreamOrderChecker.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/1/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

///////////////////////////////////////////////////////////////////////////////////////

struct StreamOrderChecker<T> {
    
    let cmp: (T, T) -> Bool
    
    init(cmp: @escaping (T, T) -> Bool) {
        self.cmp = cmp
    }
    
    mutating func reset() {
        curr = nil
        res = true
    }
    
    @discardableResult
    mutating func checkNext(_ t: T) -> Bool {
        if let curr = curr {
            let r = cmp(curr, t)
            self.curr = t
            res = res && r
            return r
        }
        
        res = true
        curr = t
        return true
    }
    
    var isOrdered: Bool {
        return res
    }
    
    fileprivate var res = true
    fileprivate var curr: T?
}


///////////////////////////////////////////////////////////////////////////////////////

func isSequenceOrdered<E: Sequence, T>(seq: E, cmp: @escaping (T, T) -> Bool) -> Bool where E.Iterator.Element == T {
    var checker = StreamOrderChecker(cmp: cmp)
    seq.forEach { (t) in
        _ = checker.checkNext(t)
    }
    
    return checker.isOrdered
}
