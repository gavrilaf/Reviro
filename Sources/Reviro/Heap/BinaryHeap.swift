//
//  BinaryHeap.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 3/30/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

class BinaryHeap<E>: HeapProtocol {

    init(sort: @escaping (E, E) -> Bool) {
        self.isBefore = sort
        count = 0
    }
    
    init(array: [E], sort: @escaping (E, E) -> Bool) {
        self.isBefore = sort
        buildHeap(array: array)
    }
    
    // MARK: Heap
    
     func push(_ e: E) {
        if count < elements.count {
            elements[count] = e
        } else {
            elements.append(e)
        }
        
        count += 1
        shiftUp(count-1)
        
        //print("after push: \(e), \(elements)")
    }
    
     func pop() -> E? {
        guard let p = top else { return nil }
        
        if count > 1 {
            swap(&elements[0], &elements[count-1])
            count -= 1
            shiftDown(0)
        } else {
            count -= 1
        }
        //print("after pop: \(p), \(elements)")
        return p
    }
    
    var top: E? {
        return count == 0 ? nil : elements[0]
    }
    
    var isEmpty: Bool {
        return size == 0
    }
    
    var size: Int {
        return count
    }
    
    // MARK: Utility
    
    func clear() {
        elements.removeAll()
        count = 0
    }
    
    // MARK:
    fileprivate let isBefore: (E, E) -> Bool
    fileprivate var elements = [E]()
    fileprivate var count = 0
}


extension BinaryHeap {
    func index(of e: E) -> Int? {
        return index(of: e, indx: 0)
        
    }
        
    fileprivate func index(of e: E, indx: Int) -> Int? {
        if indx >= count { return nil }
        
        if isEqual(e, elements[indx]) { return indx }
        if !isBefore(e, elements[indx]) { return nil }
        
        if let j = index(of: e, indx: HeapSort.leftIndex(of: indx)) { return j }
        if let j = index(of: e, indx: HeapSort.rightIndex(of: indx)) { return j }
        return nil
    }
    
    fileprivate func isEqual(_ l: E, _ r: E) -> Bool {
        return !isBefore(l, r) && !isBefore(r, l)
    }
}

extension BinaryHeap {
    
    fileprivate func shiftUp(_ indx: Int) {
        elements.withUnsafeMutableBufferPointer { buf in
            HeapSort.shiftUp(buffer: &buf, index: indx, cmp: isBefore)
        }
    }
    
    fileprivate func shiftDown(_ indx: Int) {
        elements.withUnsafeMutableBufferPointer { buf in
            HeapSort.shiftDown(buffer: &buf, index: indx, heapSize: count, cmp: isBefore)
        }
    }
    
    fileprivate func buildHeap(array: [E]) {
        guard array.count > 1 else { return }
        
        elements = array
        elements.withUnsafeMutableBufferPointer { (buf) in
            HeapSort.buildHeap(buffer: &buf, cmp: isBefore)
        }
        
        count = elements.count
    }
}
