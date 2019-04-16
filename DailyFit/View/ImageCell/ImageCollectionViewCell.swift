//
//  ImageCollectionViewCell.swift
//  DailyFit
//
//  Created by Bohdan Savych on 4/16/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(image: UIImage?) {
        self.imageView.image = image
    }
}
