//
//  ExercisesTableViewCell.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 5/27/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class ExercisesTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var exercisesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 10
        exercisesImage.roundCorner(radius: 10)
    }
    func setup(exerciseModel: ExercisesModel)
    {
        titleLabel.text = exerciseModel.title
        subtitleLabel.text = exerciseModel.muscleType
        exercisesImage.image = exerciseModel.image
    }
}
