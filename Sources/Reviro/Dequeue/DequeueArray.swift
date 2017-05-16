//
//  DequeueArray.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/19/17.
//
//

import Foundation

public final class DequeueArray<E> {
    
    init() {
        elements = Array<E>()
    }
    
    fileprivate var elements: Array<E>
}

extension DequeueArray: DequeueProtocol {
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var first: E? {
        return elements.first
    }
    
    public var last: E? {
        return elements.last
    }
    
    public func pushFirst(_ e: E) {
        elements.insert(e, at: 0)
    }
    
    public func pushLast(_ e: E) {
        elements.append(e)
    }
    
    @discardableResult
    public func popFirst() -> E? {
        if !elements.isEmpty {
            return elements.removeFirst()
        }
        return nil
    }
    
    @discardableResult
    public func popLast() -> E? {
        if !elements.isEmpty {
            return elements.removeLast()
        }
        return nil
    }
    
    public func clear() {
        elements.removeAll()
    }
}
