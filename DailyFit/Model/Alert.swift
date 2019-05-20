//
//  Alert.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
   private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert,animated: true) }
    }
    static func showIncompleteLoginAllert(on vc:UIViewController){
        showBasicAlert(on: vc, with: "Login", message: "Please fill the login field")
    }
    static func showIncompletePasswordAllert(on vc:UIViewController){
        showBasicAlert(on: vc, with: "Password", message: "Please fill the password field")
    }
    static func showAllertChecker(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Works!", message: "This shit works.")
    }
    static func showIncompleteField(on vc: UIViewController){
        showBasicAlert(on: vc, with: "Error", message: "Please fill all the fields.")
    }
    
}
