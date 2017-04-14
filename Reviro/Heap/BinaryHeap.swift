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
        self.sort = sort
        count = 0
    }
    
    init(array: [E], sort: @escaping (E, E) -> Bool) {
        self.sort = sort
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
    fileprivate let sort: (E, E) -> Bool
    fileprivate var elements = [E]()
    fileprivate var count = 0
}

extension BinaryHeap {
    
    fileprivate func shiftUp(_ indx: Int) {
        elements.withUnsafeMutableBufferPointer { buf in
            HeapSort.shiftUp(buffer: &buf, index: indx, cmp: sort)
        }
    }
    
    fileprivate func shiftDown(_ indx: Int) {
        elements.withUnsafeMutableBufferPointer { buf in
            HeapSort.shiftDown(buffer: &buf, index: indx, heapSize: count, cmp: sort)
        }
    }
    
    fileprivate  func buildHeap(array: [E]) {
        guard array.count > 1 else { return }
        
        elements = array
        elements.withUnsafeMutableBufferPointer { (buf) in
            HeapSort.buildHeap(buffer: &buf, cmp: sort)
        }
        
        count = elements.count
    }
}
