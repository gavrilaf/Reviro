//
//  HeapProtocol.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 3/30/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

protocol HeapProtocol {
    associatedtype E
    
    func push(_ e: E)
    func pop() -> E?
    
    var top: E? { get }
    
    var isEmpty: Bool { get }
    var size: Int { get }
}
