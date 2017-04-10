//
//  MergeSort.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/8/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

struct MergeSort {
    
    static func sort<E>(array: inout [E], cmp: @escaping (E, E) -> Bool) {
        sort(array: &array, left: 0, right: array.count - 1, cmp: cmp)
    }
    
    static let sortWindow = 500
    static let shellSortGaps = [9, 4, 1]
    
    static func sort<E>(array: inout [E], left: Int, right: Int, cmp: @escaping (E, E) -> Bool)
    {
        let dist = right - left
        
        if dist > sortWindow {
            let middle = (left + right) / 2;
            
            sort(array: &array, left: left, right: middle, cmp: cmp)
            sort(array: &array, left: middle+1, right: right, cmp: cmp)
            
            merge(array: &array, left: left, middle: middle, right: right, cmp: cmp)
        } else {
            ShellSort.sort(array: &array, left: left, right: right+1, gaps: shellSortGaps, cmp: cmp)
        }
    }
    
    static func merge<E>(array: inout [E], left: Int, middle: Int, right: Int, cmp: (E, E) -> Bool) {
        array.withUnsafeMutableBufferPointer { (buffer) in
            
            let leftArray: [E] = Array(buffer[left...middle])
            let rightArray: [E] = Array(buffer[middle + 1...right])
        
            let leftArrSize = leftArray.count
            let rightArrSize = rightArray.count
        
            var i = 0, j  = 0, k = left
        
            while i < leftArrSize && j < rightArrSize {
                if cmp(leftArray[i], rightArray[j]) {
                    buffer[k] = leftArray[i]
                    i += 1
                } else {
                    buffer[k] = rightArray[j]
                    j += 1
                }
                k += 1
            }
            
            while i < leftArrSize {
                buffer[k] = leftArray[i]
                i += 1
                k += 1
            }
            
            while j < rightArrSize {
                buffer[k] = rightArray[j]
                j += 1
                k += 1
            }
        }
    }
    
    /*static func merge<E>(array: inout [E], left: Int, middle: Int, right: Int, cmp: @escaping (E, E) -> Bool) {
        let leftArray: [E] = Array(array[left...middle])
        let rightArray: [E] = Array(array[middle + 1...right])
        
        let leftArrSize = leftArray.count
        let rightArrSize = rightArray.count
        
        var i = 0, j  = 0, k = left
        array.withUnsafeMutableBufferPointer { (buffer) in
            leftArray.withUnsafeBufferPointer { (leftBuffer)  in
                rightArray.withUnsafeBufferPointer { (rightBuffer) in
                    while i < leftArrSize && j < rightArrSize {
                        if cmp(leftBuffer[i], rightBuffer[j]) {
                            buffer[k] = leftBuffer[i]
                            i += 1
                        } else {
                            buffer[k] = rightBuffer[j]
                            j += 1
                        }
                        k += 1
                    }
                    
                    while i < leftArrSize {
                        buffer[k] = leftBuffer[i]
                        i += 1
                        k += 1
                    }
                    
                    while j < rightArrSize {
                        buffer[k] = rightBuffer[j]
                        j += 1
                        k += 1
                    }
                }
            }
        }
    }*/
    
    /*static func sort<E>(array: inout [E], left: Int, right: Int, cmp: (E, E) -> Bool)
    {
        if left < right {
            let middle = (left + right) / 2;
            
            sort(array: &array, left: left, right: middle, cmp: cmp)
            sort(array: &array, left: middle+1, right: right, cmp: cmp)
            
            merge(array: &array, left: left, middle: middle, right: right, cmp: cmp)
        }
    }
    
    static func merge<E>(array: inout [E], left: Int, middle: Int, right: Int, cmp: (E, E) -> Bool) {
        let leftArray: [E] = Array(array[left...middle])
        let rightArray: [E] = Array(array[middle + 1...right])
        
        let leftArrSize = leftArray.count
        let rightArrSize = rightArray.count
        
        var i = 0, j  = 0, k = left
        while i < leftArrSize && j < rightArrSize {
            if cmp(leftArray[i], rightArray[j]) {
                array[k] = leftArray[i]
                i += 1
            } else {
                array[k] = rightArray[j]
                j += 1
            }
            k += 1
        }
        
        while i < leftArrSize {
            array[k] = leftArray[i]
            i += 1
            k += 1
        }
        
        while j < rightArrSize {
            array[k] = rightArray[j]
            j += 1
            k += 1
        }
    } */
}


