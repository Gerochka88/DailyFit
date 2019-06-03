//
//  PersonalInformation.swift
//  GymWorkoutManager
//
//  Created by Liguo Jiao on 16/3/19.
//  Copyright © 2016年 McKay. All rights reserved.
//

import UIKit

class BMIBMRVC: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlet

    @IBOutlet weak var bodyFat: UITextField!
    
    @IBOutlet weak var indexDisplayLabel: UILabel!
    
    var weight = 100
    var height = 184
    var age = 21
    var gender = 0
    var tapRecognizer: UITapGestureRecognizer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        bodyFat.delegate = self

        indexDisplayLabel.textColor = UIColor.blue
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bmibmpimage.jpg")!)
        /* Configure tap recognizer */
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(BMIBMRVC.handleSingleTap(_:)))
        tapRecognizer?.numberOfTapsRequired = 1
        tapRecognizer?.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addKeyboardDismissRecognizer()
        self.subscribeToKeyboardNotifications()


    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardDismissRecognizer()
        self.unsubscribeToKeyboardNotifications()
    }
    
    @IBAction func BMRCalculation(_ sender: AnyObject) {
        if bodyFat.text?.isEmpty == true {
            let alert = UIAlertController(title: "Message", message: "Please enter your body fat percentage", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let result = BMRCalculation1(age, w: Float(weight) ?? 0.0, h: Float(height) ?? 0.0, gender: gender)
            indexDisplayLabel.text = String(result)
        }
    }
    
    @IBAction func BMICalculation(_ sender: AnyObject) {
        let result = BMICalculator(Float(weight) ?? 0.0, heights: Float(height) ?? 0.0)
        indexDisplayLabel.text = String(result)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return numberEnterOnly(replacementString: string)
    }
    
    

    fileprivate func BMRCalculation1(_ a:Int, w:Float, h:Float, gender:Int) -> Float{
        /* Harris Benedict Method
           BMR Men: BMR = 66.5 + ( 13.75 x weight in kg ) + ( 5.003 x height in cm ) – ( 6.755 x age in years )
           BMR Women: BMR = 655.1 + ( 9.563 x weight in kg ) + ( 1.850 x height in cm ) – ( 4.676 x age in years ) */
        var result : Float = 0.0
        if gender == 0 { // 0 For male
            result = 66+(13.75*w)+(5.003*h)-(6.755 * Float(a))
        } else if gender == 1 { // 1 For female
            result = 655.1+(9.563*w)+(1.85*h)-(4.676 * Float(a))
        }
        return result
    }
    fileprivate func BMRCalculation2(_ age:Int, weights:Float, bodyFat:Float) -> Float {
        /*  Katch & McArdle Method
            BMR (Men + Women) = 370 + (21.6 * Lean Mass in kg)
            Lean Mass = weight in kg – (weight in kg * body fat %)
            1 kg = 2.2 pounds, so divide your weight by 2.2 to get your weight in kg */
        var result : Float = 0.0
        var leanMass : Float = 0.0
        leanMass = weights - (weights * bodyFat)
        result = 370 + (21.6 * leanMass)
        return result
    }
    fileprivate func BMICalculator(_ weights:Float, heights:Float) -> Float {
        // Metric Units: BMI = Weight (kg) / (Height (m) x Height (m))
        let result = 10000*(weights / (heights * heights))
        return result
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    func numberEnterOnly(replacementString string: String) -> Bool {
        let inverseSet = CharacterSet(charactersIn:"0123456789.").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        return string == filtered
    }
}

// MARK: - ProfileViewController (Show/Hide Keyboard)

extension BMIBMRVC:UIGestureRecognizerDelegate {
    
    func addKeyboardDismissRecognizer() {
        print("add keyboard dissmiss recognizer")
        view.addGestureRecognizer(tapRecognizer!)
    }
    
    func removeKeyboardDismissRecognizer() {
        view.removeGestureRecognizer(tapRecognizer!)
    }
    
    @objc func handleSingleTap(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let view = touch.view {
            if view is UIButton{
                return false
            }
        }
        return true
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("keyboard will show")
        print("height is " + String(describing: getKeyboardHeight(notification)/2))
        if(view.frame.origin.y == 0.0){
            view.frame.origin.y -= getKeyboardHeight(notification) / 2
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        print("keyboard will hide")
        view.frame.origin.y = 0.0
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = (notification as NSNotification).userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
   
}


