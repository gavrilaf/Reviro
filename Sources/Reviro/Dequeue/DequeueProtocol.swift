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
    
    func pushFirst(_ e: Element)
    func pushLast(_ e: Element)
    
    @discardableResult
    func popFirst() -> Element?
    
    @discardableResult
    func popLast() -> Element?
    
    func clear()
}
