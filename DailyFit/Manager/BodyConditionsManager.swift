//
//  BodyConditionsManager.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 4/16/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

final class BodyConditionsManager {
    static let shared = BodyConditionsManager()
    private init() {
        createDummy()
    }
    
    var bodyConditions = [BodyCondition]()
    
    func createDummy() {
        self.bodyConditions = [BodyCondition(date: Date(), weight: 82, height: 184, chest: 70, biceps: 24, image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: 50, height: 50, chest: 40, biceps: 20, image: UIImage(named: "Taras Vitoshko small")),BodyCondition(date: Date(), weight: 20, height: 20, chest: 20, biceps: 110, image: UIImage(named: "BackGroundLogo"))]
    }
}
