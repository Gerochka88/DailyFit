//
//  TernarWrapper.swift
//  PoEHerald
//
//  Created by bbb on 6/7/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import UIKit

extension Int {
    func ifZeroThen(_ val: Int) -> Int {
        return self == 0 ? val : self
    }
}

extension Double {
    func ifZeroThen(_ val: Double) -> Double {
        return self == 0 ? val : self
    }
}

extension CGFloat {
    func ifZeroThen(_ val: CGFloat) -> CGFloat {
        return self == 0 ? val : self
    }
}

extension String {
    func ifEmptyThen(_ val: String) -> String {
        return self.isEmpty ? val : self
    }
}
