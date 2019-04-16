//
//  ViewController.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/17/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfPassword: SATextField!
    @IBOutlet weak var tfUsername: SATextField!
    
    // MARK: - Login Button
    @IBAction func btnLogin(_ sender: SAButton) {
        if(tfUsername.text == ""){
            Alert.showIncompleteLoginAllert(on: self)
        }
        else if(tfPassword.text == ""){
            Alert.showIncompletePasswordAllert(on: self)
        }
       
        else {
            performSegue(withIdentifier: "LoginSegue", sender: self)
        }
        
    }
    
    let backgroundImageView = UIImageView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBackground()
        hideKeyboardWhenTappedAround()
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    }
    // MARK: - SetBackGround
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "loginbackground")
        view.sendSubviewToBack(backgroundImageView)
    }
  // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //  let destinationVC: MainMenuVC = segue.destination as! MainMenuVC
  //      destinationVC.labelText = tfUsername.text! }
}
// MARK: - Hide Keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
        action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
