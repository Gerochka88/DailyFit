//
//  UISliderX.swift
//  004 - Calculator (Tip)
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

@IBDesignable
class UISliderX: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        setThumbImage(thumbImage, for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(highlighted, for: .highlighted)
        } else {
            setThumbImage(thumbImage, for: .highlighted)
        }
    }
}
