//
//  UIViewController.swift
//  Rolique
//
//  Created by Andrii Narinian on 9/1/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

extension UIViewController {    
    var navigationBarHeight: CGFloat {
        let navigationBarFrame = navigationController?.navigationBar.frame ?? .zero
        return navigationBarFrame.origin.y + navigationBarFrame.height
    }
    
    var tabBarHeight: CGFloat {
        return tabBarController?.tabBar.frame.size.height ?? 0
    }
    
    func presentPlayer(with url: URL, animated: Bool = true, completion: (() -> Void)? = nil) {
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.present(playerController, animated: true, completion: completion ?? { player.play() })
    }
    
    func close(animated: Bool = true, completion: (() -> Void)? = nil) {
        if (navigationController?.viewControllers.count ?? 0) > 1 {
            navigationController?.popViewController(animated: animated)
            completion?()
        } else if presentingViewController != nil {
            dismiss(animated: animated, completion: completion)
        }
    }
}
