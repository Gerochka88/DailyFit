//
//  SettingsVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 3/17/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import UIKit
import HealthKit
import HealthKitUI

let healthKitStore:HKHealthStore = HKHealthStore()


class SettingsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var lblBloodType: UILabel!

    @IBAction func btnGetHKData(_ sender: Any) {
        let (age, blood, biologicalSex) = self.readProfile()
        
        self.lblAge.text = "\(String(describing: age!))"
        self.lblBloodType.text = self.getReadableBT(bloodType: blood?.bloodType)
        self.lblGender.text = self.getReadableGender(biologicalSex: biologicalSex?.biologicalSex)
        //let calendar = Calendar.current
        
    }
   
    //MARK:- Image Picker Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let profileImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        profileImg.image = profileImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- Tap Recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ImageTapped))
        self.profileImg.addGestureRecognizer(tapGesture)
        
        //MARK:- Corner profile image
        profileImg.toCirle()
        profileImg.layer.borderColor = UIColor.white.cgColor
        profileImg.layer.borderWidth = 2
        //MARK:- HK authorization
        autorizeHealthKit()
        //MARK:- background color
        view.setGradientBackgroundColor(colorOne: Colors.darkGrey , colorTwo:Colors.lightGrey, colorThree: Colors.veryDarkGrey, colorFour: Colors.black)
    }
    //MARK: - Image tapped
    @objc func ImageTapped() {
        let picturePickerController = UIImagePickerController()
        picturePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose photo source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            picturePickerController.sourceType = .camera
            self.present(picturePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action: UIAlertAction) in
            picturePickerController.sourceType = .photoLibrary
            self.present(picturePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    //MARK: - Reading data from Health kit (Age, BT)
    func readProfile() -> (age:Int?, bloodtype :HKBloodTypeObject?, biologicalSex: HKBiologicalSexObject?){
        var age:Int?
        var bloodtype:HKBloodTypeObject?
        var biologicalSex:HKBiologicalSexObject?
        
        //Read Age
        
        do {
            let birthDay = try healthKitStore.dateOfBirthComponents()
            let calendar = Calendar.current
            let currentyear = calendar.component(.year, from: Date())
            age = currentyear - birthDay.year!
            
        } catch{}
        //Read blood type
        
        do {
            bloodtype = try healthKitStore.bloodType()
        }catch{}
        //Read biological Sex
        do {
            biologicalSex = try healthKitStore.biologicalSex()
        } catch {}
        
        return (age,bloodtype,biologicalSex)
    }
    
    //MARK: Authorization of Health kit
    func autorizeHealthKit()
    {
        let healthKitTypesToRead : Set<HKObjectType> = [
            
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!,
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType)!,
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
        ]
        
        let healthKitTypesToWrite : Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
        ]
        
        if !HKHealthStore.isHealthDataAvailable()
        {
            print("ErrorOccured")
            return
        }
        
        healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead)
        {
            (success,error) -> Void in
            
            print("Read Write authorization secceeded")
        }
        
    }
    //MARK:- Date converting func
    func getWholeDate(date : Date) -> (startDate:Date, endDate: Date) {
        var startDate = date
        var length = TimeInterval()
        _ = Calendar.current.dateInterval(of: .day, start: &startDate, interval: &length, for: startDate)
        let endDate:Date = startDate.addingTimeInterval(length)
        return (startDate,endDate)
    }
    //MARK:- Blood Type converting func
    func getReadableGender(biologicalSex:HKBiologicalSex?)->String
    {
        var biologicalSexText = " "
        if biologicalSex != nil
        {
            switch(biologicalSex! ){
            case.female:
                biologicalSexText = "Female"
            case.male:
                biologicalSexText = "Male"
            case.other:
                biologicalSexText = "Other"
            case.notSet:
                biologicalSexText = "Not Set"
            default:
                break;
            }
            
        }
        
        return biologicalSexText;
        
    }
    func getReadableBT(bloodType:HKBloodType?)->String
        
    {
        var bloodTypeText = "";
        if bloodType != nil
        {
            switch(bloodType! ){
            case.aPositive:
                bloodTypeText = "A+"
            case.aNegative:
                bloodTypeText = "A-"
            case.bPositive:
                bloodTypeText = "B+"
            case.bNegative:
                bloodTypeText = "B-"
            case.abPositive:
                bloodTypeText = "AB+"
            case.abNegative:
                bloodTypeText = "AB-"
            case.oPositive:
                bloodTypeText = "0+"
            case.oNegative:
                bloodTypeText = "0-"
            default:
                break;
            }
            
        }
        
        return bloodTypeText;
        
    }
    
    //---
}
