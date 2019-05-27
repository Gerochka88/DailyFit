//
//  TotalOfStepsVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 5/10/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class TotalOfStepsVC: UIViewController {
    
    @IBOutlet weak var totalOfStepsView: TotalOfStepsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalOfStepsView.play()
    }
}
