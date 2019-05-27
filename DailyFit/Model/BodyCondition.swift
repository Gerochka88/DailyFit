//
//  BodyCondition.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 4/16/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

final class BodyCondition {
    var date: Date?
    var weight: Double?
    var height: Double?
    var chest: Double?
    var biceps: Double?
    var image: UIImage?
    
    init(date: Date?, weight: Double?, height: Double?, chest: Double?, biceps: Double?, image: UIImage?) {
        self.date = date
        self.weight = weight
        self.height = height
        self.chest = chest
        self.biceps = biceps
        self.image = image
    }
}
