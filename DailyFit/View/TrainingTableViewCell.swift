//
//  TrainingTableViewCell.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/2/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class TrainingTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var muscleType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 10

    }
    func setup(trainingModel: TrainingModel)
    {
        dateLabel.text = DateFormatterHelper.convertToString(from: trainingModel.date.orCurrent, with: .weekDayMonthDayHHmm)
        nameLabel.text = trainingModel.title
        muscleType.text = trainingModel.subtitle
    }
}

