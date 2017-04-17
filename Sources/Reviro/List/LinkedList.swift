//
//  LinkedList.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/17/17.
//
//

import Foundation

public final class LinkedList<E> {
    
    public init() {
        nilNode = Node<E>()
    }
    
    
    class Node<E> {
        let value: E?
        var next: Node?
        var prev: Node?
        
        init() {
            value = nil
        }
        
        init(value: E) {
            self.value = value
        }
    }
    
    let nilNode: Node<E>
}

extension LinkedList: DequeueProtocol {
    
    public var isEmpty: Bool {
        return first != nil
    }
    
    public var first: E? {
        return nil
    }
    
    public var last: E? {
        return nil
    }
    
    public func pushFirst(e: E) {
    }
    
    public func pushLast(e: E) {
    
    }
    
    public func popFirst() -> E? {
        return nil
    }
    
    public func popLast() -> E? {
        return nil
    }
    
    public func clear() {
    
    }

}
