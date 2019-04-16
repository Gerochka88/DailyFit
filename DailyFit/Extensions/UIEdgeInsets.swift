//
//  UIEdgeInsets.swift
//  Rolique
//
//  Created by Bohdan Savych on 9/11/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    var horizontal: CGFloat {
        return top + bottom
    }
    
    var vertical: CGFloat {
        return left + right
    }
    
    init(side: CGFloat) {
        self.init(top: side, left: side, bottom: side, right: side)
    }
}
