//
//  ExercisesVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 5/27/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class ExercisesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        tableView.dataSource = self
        tableView.delegate = self
        
        ExerciseFunction.getData(completion: { [weak self] in
            self?.tableView.reloadData()
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         setupNavBar()
        self.tableView.reloadData()
    }
    func setupNavBar() {
       // navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    //MARK:- Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExercisesToDetail" {
            let destVC = segue.destination as! ExercisesDetailVC
            destVC.exercise = sender as? ExercisesModel
        }
    }
}
//MARK:- Tabble Data init
    extension ExercisesVC: UITableViewDataSource , UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ExerciseManager.exerciseModels.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExercisesTableViewCell
            
            cell.setup(exerciseModel: ExerciseManager.exerciseModels[indexPath.row])
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let exercise = ExerciseManager.exerciseModels[indexPath.row]
        performSegue(withIdentifier: "ExercisesToDetail", sender: exercise)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 130
        }
}
