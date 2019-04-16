//
//  Int.swift
//  Rolique
//
//  Created by Bohdan Savych on 10/13/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import Foundation

extension Int {
    var factorial: Int {
        guard self >= 0 else { assert(false, "factorial can be calculated only for non-negative value") }
        
        if self == 0 { return  0 }
        
        return self + (self - 1).factorial
    }
}
