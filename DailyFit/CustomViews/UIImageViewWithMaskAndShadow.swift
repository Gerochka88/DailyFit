//
//  borderedMaskedImageView.swift
//  MaskImagePaypal
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

@IBDesignable
class UIImageViewWithMaskAndShadow: UIImageView {
    var imageToMaskView = UIImageView()
    var maskingImageView = UIImageView()
    
    @IBInspectable
    var imageToMask: UIImage? {
        didSet {
            imageToMaskView.image = imageToMask
            updateView()
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        maskingImageView.image = image
        
        if imageToMaskView.image != nil {
            imageToMaskView.contentMode = .scaleAspectFit
            imageToMaskView.frame = bounds
            
            maskingImageView.contentMode = .center
            maskingImageView.frame = bounds//imageToMaskView.frame
            
            imageToMaskView.layer.mask = maskingImageView.layer
            
            addSubview(imageToMaskView)
        }
    }
}
