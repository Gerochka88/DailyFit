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
        self.bodyConditions = [BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition")),BodyCondition(date: Date(), weight: Double.random(in: 0...10), height: Double.random(in: 0...10), chest: Double.random(in: 0...10), biceps: Double.random(in: 0...10), image: UIImage(named: "BodyCondition"))]
    }
}
