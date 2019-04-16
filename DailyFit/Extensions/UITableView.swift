//
//  UITableView.swift
//  Rolique
//
//  Created by Bohdan Savych on 8/30/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import UIKit

extension UITableView {
    @discardableResult
    func update<T>(_ actions: () -> T) -> T {
        self.beginUpdates()
        defer {
            self.endUpdates()
        }
        
        return actions()
    }
    
    func setDelegateAndDataSource(_ object: UITableViewDelegate & UITableViewDataSource) {
        self.delegate = object
        self.dataSource = object
    }
    
    func scrollToBottom(animated: Bool = true) {
        let section = numberOfSections - 1
        let row = numberOfRows(inSection: section) - 1
        
        guard section >= 0, row >= 0 else {
            return
        }
        
        let indexPath = IndexPath(row: row, section: section)
        scrollToRow(at: indexPath, at: .bottom, animated: animated)
    }
    
    var capturedImage : UIImage {
        UIGraphicsBeginImageContextWithOptions(contentSize, false, 0.0);
        let savedContentOffset = contentOffset
        let savedFrame = frame
        contentOffset = .zero
        frame = CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        contentOffset = savedContentOffset;
        frame = savedFrame;
        UIGraphicsEndImageContext();
        
        return image!;
    }
    
    func dequeue<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: type.self), for: indexPath) as! T
    }
}
