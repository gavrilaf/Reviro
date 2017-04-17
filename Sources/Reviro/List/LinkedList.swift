//
//  LinkedList.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/17/17.
//
//

import Foundation

public final class LinkedList<E> {
    
    class Node<E> {
        let value: E
        var next: Node?
        var prev: Node?
        
        init(value: E) {
            self.value = value
        }
    }
    
    
    

}
