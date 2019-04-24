//
//  BodyConditionsManager.swift
//  DailyFit
//
//  Created by Bohdan Savych on 4/16/19.
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
        self.bodyConditions = [BodyCondition(date: Date(), weight: 82, height: 184, chest: 70, biceps: 24, image: UIImage(named: "BodyCondition"))]
    }
}
