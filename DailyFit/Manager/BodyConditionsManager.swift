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
        self.bodyConditions = [BodyCondition(date: Date(), weight: 150, height: 184, chest: 70, biceps: 14, image: UIImage(named: "BadBodyCondition")),BodyCondition(date: Date(), weight: 80, height: 184, chest: 40, biceps: 80, image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: 100, height: 190, chest: 80, biceps: 110, image: UIImage(named: "GoodBodyCondition"))]
    }
}
