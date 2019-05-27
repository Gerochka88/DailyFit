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
   
    var tableData: [ExercisesModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        tableView.dataSource = self
        tableView.delegate = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
         setupNavBar()
    }
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
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
            return tableData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExercisesTableViewCell
            
            cell.setup(exerciseModel: tableData[indexPath.row])
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let exercise = tableData[indexPath.row]
        performSegue(withIdentifier: "ExercisesToDetail", sender: exercise)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 130
        }
}

