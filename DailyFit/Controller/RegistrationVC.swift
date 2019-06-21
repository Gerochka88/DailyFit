//
//  RegistrationVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 6/21/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var confirmPassLbl: SATextField!
    @IBOutlet weak var passwordLbl: SATextField!
    @IBOutlet weak var usernameLbl: SATextField!
    
    @IBAction func registerBtn(_ sender: Any) {
    }
    let backgroundImageView = UIImageView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
// MARK: - SetBackGround
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "signupimage")
        view.sendSubviewToBack(backgroundImageView)
    }

}
extension RegistrationVC: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        if textField === tfUsername {
        //            tfPassword.becomeFirstResponder()
        //        } else {
        self.view.endEditing(true)
        //        }
        
        return true
    }
}
