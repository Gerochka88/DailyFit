//
//  AddNewBodyConditionVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 4/17/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class AddNewBodyConditionVC: UIViewController {
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtChest: UITextField!
    @IBOutlet weak var txtBiceps: UITextField!
    @IBOutlet weak var imgBodyCondition: UIImageView!
    
    var myImage : UIImage?
   

    @IBAction func btnSave(_ sender: Any) {
        
        if(txtHeight.text == "" || txtHeight.text == "" || txtWeight.text == "" || txtBiceps.text == "")
        {
         Alert.showIncompleteField(on: self)
        }
        else {
            
        let weight: Double = Double(txtWeight.text.orEmpty).orZero
        let height: Double = Double(txtHeight.text.orEmpty).orZero
        let chest: Double = Double(txtChest.text.orEmpty).orZero
        let biceps: Double = Double(txtBiceps.text.orEmpty).orZero
    
    BodyConditionsManager.shared.bodyConditions.append(BodyCondition(date: Date(), weight: weight, height: height, chest: chest, biceps: biceps, image: myImage))
        
        navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(Tapped))
        self.imgBodyCondition.addGestureRecognizer(TapGesture)

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
//Added image picker controller
extension AddNewBodyConditionVC :  UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    //MARK - image picker controller
    @objc func Tapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose photo source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        myImage = image
        imgBodyCondition.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
