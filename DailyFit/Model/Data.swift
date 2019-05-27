//
//  Data.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/18/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    static func getData(completion: @escaping ([ExercisesModel]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [ExercisesModel]()
            data.append(ExercisesModel(title: "Legs", subTitle: "Leg press", image: UIImage(named: "legpress"), data1: "Data1", data2: "Data2"))
            data.append(ExercisesModel(title: "Legs", subTitle: "Squats", image: UIImage(named: "squats"), data1: "Data1", data2: "Data2"))
            data.append(ExercisesModel(title: "Legs", subTitle: "Burpees", image: UIImage(named: "burpees"), data1: "Data1", data2: "Data2"))
            data.append(ExercisesModel(title: "Legs", subTitle: "Deadlift", image: UIImage(named: "deadlift"), data1: "Data1", data2: "Data2"))
            data.append(ExercisesModel(title: "Legs", subTitle: "Deadlift", image: UIImage(named: "deadlift"), data1: "Data1", data2: "Data2"))
            data.append(ExercisesModel(title: "Legs", subTitle: "Deadlift", image: UIImage(named: "deadlift"), data1: "Data1", data2: "Data2"))
            data.append(ExercisesModel(title: "Legs", subTitle: "Deadlift", image: UIImage(named: "deadlift"), data1: "Data1", data2: "Data2"))
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
