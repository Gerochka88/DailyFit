//
//  ExercisesDetailVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 5/27/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class ExercisesDetailVC: UIViewController {
    @IBOutlet weak var exercisesSubtitleView: UILabel!
    @IBOutlet weak var exercisesPictureView: UIImageView!
    @IBOutlet weak var exercisesTitleLabel: UILabel!
    @IBOutlet weak var exercisesDecriptionTextView: UITextView!
    
    var exercise: ExercisesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        exercisesPictureView.image = exercise?.image
        exercisesTitleLabel.text = exercise?.title
        exercisesSubtitleView.text = exercise?.muscleType
        exercisesDecriptionTextView.text = exercise?.description
        
    }

}
