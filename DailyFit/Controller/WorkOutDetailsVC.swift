//
//  WorkOutDetailsVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/3/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class WorkOutDetailsVC: UIViewController {
 
    @IBOutlet weak var trainingNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    var exercise: ExercisesModel?
    var trainings: TrainingModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
        setUI()
        tableView.reloadData()
    
    }
    
    func setUI(){
    trainingNameLabel.text = trainings?.title
    typeLabel.text = trainings?.subtitle
    dateLabel.text = DateFormatterHelper.convertToString(from: (trainings?.date.orCurrent)!, with: .weekDayMonthDayHHmm)
        
    }
    
}
//MARK:- Tabble Data init
//extension WorkOutDetailsVC : UITableViewDataSource , UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ExerciseManager.exerciseModels.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "detailcell") as! ExercisesTableViewCell
//
//        cell.setup(exerciseModel: ExerciseManager.exerciseModels[indexPath.row])
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
//}

