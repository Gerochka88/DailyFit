//
//  AddNewExerciseVС.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 5/27/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit

class AddNewExerciseVС: UIViewController {
    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var exerciseTypeTextField: UITextField!
    @IBOutlet weak var exerciseDecriptionTextField: UITextField!
    var myImage : UIImage?
    
    @IBAction func saveExerciseButton(_ sender: Any) {
        if(exerciseNameTextField.text == "" || exerciseTypeTextField.text == "" || exerciseDecriptionTextField.text == "")
        {
            Alert.showIncompleteField(on: self)
        }
        else {
            
            let exerciseName: String = exerciseNameTextField.text.orEmpty
            let exerciseType: String = exerciseTypeTextField.text.orEmpty
            let exerciseDescription: String = exerciseDecriptionTextField.text.orEmpty
       
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(Tapped))
        self.exerciseImageView.addGestureRecognizer(TapGesture)
    }
    

}

//MARK:- Added Image Picker Controller
extension AddNewExerciseVС: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
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
        exerciseImageView.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
