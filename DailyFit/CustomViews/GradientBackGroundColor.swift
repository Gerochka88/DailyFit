//
//  GradientBackGroundColor.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/20/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setGradientBackgroundColor(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor, colorFour: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorFour.cgColor]
        gradientLayer.locations = [0.0, 0.3, 0.9, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
