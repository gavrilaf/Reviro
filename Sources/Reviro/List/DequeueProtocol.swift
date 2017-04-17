//
//  DequeueProtocol.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/17/17.
//
//

import Foundation

public protocol DequeueProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    
    var first: Element? { get }
    var last: Element? { get }
    
    func pushFirst(e: Element)
    func pushLast(e: Element)
    
    func popFirst() -> Element?
    func popLast() -> Element?
    
    func clear()
}
