//
//  BestScoreVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 5/20/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class BestScoreVC: UIViewController {

    @IBOutlet weak var bestScoreView: BestScoreView!
        override func viewDidLoad() {
        super.viewDidLoad()
        bestScoreView.play()
    }
    
}
