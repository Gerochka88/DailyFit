//
//  TrainingFunction.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/2/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class TrainingFunction {
    static func addData(trainingModel: TrainingModel){
        TrainingManager.trainingModels.append(trainingModel)
    }
    
    static func getData(completion: @escaping () -> ()) {
        completion()
    }
}
