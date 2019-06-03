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
    @IBOutlet weak var lblBiceps: UILabel!
    @IBOutlet weak var bodyConditionsCollectionView: UICollectionView!
    
    
    private lazy var bodyConditions = [BodyCondition]()
    private var currentIndex = 0 {
        didSet {
            if oldValue != currentIndex {
                self.configureUI(for: currentIndex)
            }
        }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bodyConditions = BodyConditionsManager.shared.bodyConditions
        self.bodyConditionsCollectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        configureCollectionView()
        self.bodyConditions = BodyConditionsManager.shared.bodyConditions
        self.bodyConditionsCollectionView.reloadData()
        
        configureUI(for: 0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func scheduleNotification(inSeconds seconds: TimeInterval, completion: (Bool) -> ()) {
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        print(date)
        let content = UNMutableNotificationContent()
        content.title = "Calm down, bro."
        content.body = "Your hearth rate is over 180! That's could be dangerous for your health! stop and get rest!"
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
    
    //--------------------
}

private extension BodyConditionsVC {
    func configureCollectionView() {
        self.bodyConditionsCollectionView.delegate = self
        self.bodyConditionsCollectionView.dataSource = self
        self.bodyConditionsCollectionView.register(ImageCollectionViewCell.self)
    }
    
    func configureUI(for index: Int) {
        guard index < self.bodyConditions.count else { return }
        
        let bodyCondition = self.bodyConditions[index]
        lblWeight.text = String(bodyCondition.weight.orZero)
        lblHeight.text = String(bodyCondition.height.orZero)
        lblChest.text = String(bodyCondition.chest.orZero)
        lblBiceps.text = String(bodyCondition.biceps.orZero)
        lblDate.text = DateFormatterHelper.convertToString(from: bodyCondition.date.orCurrent, with: .weekDayMonthDayHHmm)
    }
}

// MARK: - UICollectionViewDelegate
extension BodyConditionsVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        self.currentIndex = index
    }
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

// MARK: - UICollectionViewDelegateFlowLayout
extension BodyConditionsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
