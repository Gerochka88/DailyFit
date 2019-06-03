//
//  WorkOutVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/2/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class WorkOutVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.dataSource = self
        tableView.delegate = self
        TrainingFunction.getData { [weak self] in
            self?.tableView.reloadData()
            }
        
        }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        setupNavBar()
    }
    
    func setupNavBar() {
        // navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    //MARK:- Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrainingsToDetail" {
            let destVC = segue.destination as! WorkOutDetailsVC
            destVC.trainings = sender as? TrainingModel
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return   TrainingManager.trainingModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "trainingcell") as! TrainingTableViewCell
    
        cell.setup(trainingModel: TrainingManager.trainingModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let training = TrainingManager.trainingModels[indexPath.row]
        performSegue(withIdentifier: "TrainingsToDetail", sender: training)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
