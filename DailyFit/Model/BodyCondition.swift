//
//  BodyCondition.swift
//  DailyFit
//
//  Created by Bohdan Savych on 4/16/19.
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
    
    init(date: Date?, weight: Double?, chest: Double?, biceps: Double?, image: UIImage?) {
        self.date = date
        self.weight = weight
        self.chest = chest
        self.biceps = biceps
        self.image = image
    }
}
