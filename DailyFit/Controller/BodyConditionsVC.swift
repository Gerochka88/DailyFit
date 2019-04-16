//
//  BodyConditionsVC.swift
//  DailyFit
//
//  Created by Taras Vitoshko on 4/9/19.
//  Copyright © 2019 Taras Vitoshko. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import FlexiblePageControl

class BodyConditionsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblChest: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var bodyConditionsImageView: UIImageView!
    @IBOutlet weak var bodyConditionsCollectionView: UICollectionView!
    
    private lazy var bodyConditions = [BodyCondition]()
 
    @IBAction func btnChooseImg(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        
        
    }
    
    @IBAction func btnSaveData(_ sender: Any) {
      
        scheduleNotification(inSeconds: 5) { (success) in
            if success
            {
                print("success")
            }
            else {
                print("oups, something going wrong")
            }
        }
    }


    override func viewDidLoad() {
    super.viewDidLoad()
        bodyConditionsImageView.image = #imageLiteral(resourceName: "BodyCondition")
        lblWeight.text = "88,5 kg"
        lblHeight.text = "184 cm"
        lblChest.text = "60 cm"
        hideKeyboardWhenTappedAround()
    var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
     }
      
  }
    func scheduleNotification(inSeconds seconds: TimeInterval, completion: (Bool) -> ()) {
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(date)
        let content = UNMutableNotificationContent()
        content.title = "Hey you are fat"
        content.body = "BUT STILL YOU ARE AMAZING PROGRAMMER!!!"
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
        
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    //------
}

private extension BodyConditionsVC {
    func configureCollectionView() {
        self.bodyConditionsCollectionView.delegate = self
        self.bodyConditionsCollectionView.dataSource = self
        self.bodyConditionsCollectionView.register(ImageCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDelegate
extension BodyConditionsVC: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension BodyConditionsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ImageCollectionViewCell.self)
        let bodyCondition = self.bodyConditions[indexPath.item]
        cell.configure(image: bodyCondition.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bodyConditions.count
    }
}
