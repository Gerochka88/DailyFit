//
//  UICollectionView.swift
//  Spyfall
//
//  Created by bbb on 9/15/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import UIKit

extension UICollectionView {
    func setDelegateAndDatasource(_ object: UICollectionViewDelegate & UICollectionViewDataSource) {
        self.delegate = object
        self.dataSource = object
    }
}
