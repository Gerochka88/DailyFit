//
//  Functions.swift
//  Spyfall
//
//  Created by bbb on 10/16/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation

struct Functions {
    static func id<T>(_ value: T) -> T {
        return value
    }
    
    static func cast<From, To>(_ value: From) -> To? {
        return value as? To
    }
    
    static func toClosure<T>(_ value: T) -> (() -> T) {
        return { value }
    }
    
    static func printObject(_ object: Any) {
        print(object)
    }
    
    static func to<T>(_ function: @escaping (() -> Void)) -> ((T) -> Void) {
        return { _ in
            function()
        }
    }
    
    static func to<T, G>(_ function: @escaping (() -> Void)) -> ((T, G) -> Void) {
        return { _, _ in
            function()
        }
    }
    
    static func to<T, G, H>(_ function: @escaping (() -> Void)) -> ((T, G, H) -> Void) {
        return { _, _, _ in
            function()
        }
    }
}
