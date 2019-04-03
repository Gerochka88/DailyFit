//
//  MainMenuVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/17/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {

    @IBOutlet weak var lbMainMenu: UILabel!
    var labelText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMainMenu.text = labelText
        view.setGradientBackgroundColor(colorOne: Colors.darkGrey , colorTwo:Colors.lightGrey, colorThree: Colors.veryDarkGrey, colorFour: Colors.black)
    }

}
