//
//  Model.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//
/*
 This is the model class that holds your data.
 This model is what is shown in a tableview, collectionview, pickerview row, etc.
 */

import UIKit

class ExercisesModel {
    
    var title = ""
    var muscleType = ""
    var image: UIImage?
    var description = ""
    var sets = 0
    var repeats = 0
    var weight = 0

    
    init(title: String, muscleType: String, image: UIImage?, description: String, sets: Int, repeats: Int, weight: Int) {
        self.title = title
        self.muscleType = muscleType
        self.image = image
        self.description = description
        self.sets = sets
        self.repeats = repeats
        self.weight = weight

    }
}

