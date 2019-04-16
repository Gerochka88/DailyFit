//
//  Created by Taras Vitoshko on 3/17/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//
import UIKit

class DashBoardVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var screenCoverButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageViewX!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var breakButton: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var hotButton: UIButton!
    
    @IBAction func homeButton(_ sender: Any) {
        hideMenu()
    }
    @IBOutlet weak var menuCurveImageView: UIImageView!
    
    var tableData: [Model] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCurveImageView.image = #imageLiteral(resourceName: "MenuCurve")
        tableView.dataSource = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        hideMenu()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func menuTapped(_ sender: UIButton) {
        showMenu()
    }
    
    @IBAction func screenCoverTapped(_ sender: UIButton) {
        hideMenu()
    }
    
    func showMenu() {
        menuView.isHidden = false
        
        UIView.animate(withDuration: 0.7, animations: {
            self.screenCoverButton.alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.06, options: .curveEaseOut, animations: {
            self.menuCurveImageView.transform = .identity
        })
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.searchButton.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.06, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.locationButton.transform = .identity
            self.breakButton.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.12, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.homeButton.transform = .identity
            self.alertButton.transform = .identity
        })

         UIView.animate(withDuration: 0.4, delay: 0.18, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.profileImageView.transform = .identity
            self.hotButton.transform = .identity
        })
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.7, animations: {
            self.screenCoverButton.alpha = 0
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.profileImageView.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
            self.hotButton.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.08, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.homeButton.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
            self.alertButton.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.16, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.locationButton.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
            self.breakButton.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.08, options: .curveEaseOut, animations: {
            self.menuCurveImageView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.21, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.searchButton.transform = CGAffineTransform(translationX: -self.menuView.frame.width, y: 0)
        }) { success in
            self.menuView.isHidden = true
        }
    }
}

extension DashBoardVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}
