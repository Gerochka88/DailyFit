//
//  Dictionary.swift
//  PoEHerald
//
//  Created by bbb on 5/21/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation

extension Dictionary {
    func printDescription() {
        for (key, value) in self {
            print("key - \(key) value type - \(value.self)")
        }
    }
}

func +=<K, V> (left: inout [K : V], right: [K : V]) {
    for (k, v) in right {
        left[k] = v
    }
}
