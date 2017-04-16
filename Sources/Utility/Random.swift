//
//  Random.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/1/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

func randomArray(size: Int) -> [Int] {
    var ar = [Int]()
    for _ in 0..<size {
        ar.append(Int(arc4random_uniform(1000)))
    }
    
    return ar
}
