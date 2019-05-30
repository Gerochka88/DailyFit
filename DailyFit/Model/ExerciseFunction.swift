//
//  ExerciseFunction.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class ExerciseFunction {
    static func addData(exerciseModel: ExercisesModel){
        ExerciseManager.exerciseModels.append(exerciseModel)
    }
    
    static func getData(completion: @escaping () -> ()) {
        completion()
    }
}
