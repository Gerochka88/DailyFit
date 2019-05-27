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
        
        tableView.dataSource = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
    }
    
}
    extension ExercisesVC: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tableData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            if cell == nil {
             cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            cell!.textLabel?.text = tableData[indexPath.row].subTitle
            
            return cell!
        }
}
