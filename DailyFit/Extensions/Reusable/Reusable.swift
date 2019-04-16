//
//  Reusable.swift
//  abl
//
//  Created by AliSoftware on 12/17/16.
//  Copyright © 2016 Perpetio. All rights reserved.
//

import Foundation

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

typealias NibReusable = Reusable & NibLoadable
