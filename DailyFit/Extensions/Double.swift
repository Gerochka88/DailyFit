//
//  Double.swift
//  PoEHerald
//
//  Created by Bohdan Savych on 11/24/17.
//  Copyright © 2017 bbb. All rights reserved.
//

import Foundation

extension Double {
    func rounded(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        
        return (self * divisor).rounded() / divisor
    }
}
