//
//  TrainingsDetailsTableViewCell.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/3/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class TrainingsDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repeatsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var cardCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        cardCellView.layer.shadowOpacity = 1
        cardCellView.layer.shadowOffset = CGSize.zero
        cardCellView.layer.shadowColor = UIColor.darkGray.cgColor
        cardCellView.layer.cornerRadius = 10
    }
    func setup(exerciseModel: ExercisesModel)
    {
        exerciseNameLabel.text = exerciseModel.title
        setsLabel.text = "4"
        repeatsLabel.text = "10"
        weightLabel.text = "80kg"
    }
 
}
