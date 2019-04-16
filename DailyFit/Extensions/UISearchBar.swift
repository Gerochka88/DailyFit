//
//  UISearchBar.swift
//  PoEHerald
//
//  Created by bbb on 5/25/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import UIKit

extension UISearchBar {
    var cancelButtonTitle: String {
        get {
            return (value(forKey: "_cancelButtonText") as? String).orEmpty
        } set {
            setValue(newValue, forKey: "_cancelButtonText")
        }
    }
}
