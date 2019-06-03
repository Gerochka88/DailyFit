//
//  TrainingModel.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/2/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.


import UIKit

final class TrainingModel {
    var date: Date?
    var title = ""
    var subtitle = ""
    var weight: Int
    var numberOfSets: Int
    var numberOfRepeats: Int
 

    init(date: Date?,title: String, subtitle: String,weight: Int, numberOfSets: Int, numberOfRepeats:Int) {
        self.date = date
        self.title = title
        self.subtitle = subtitle
        self.weight = weight
        self.numberOfSets = numberOfSets
        self.numberOfRepeats = numberOfRepeats
    }
}
