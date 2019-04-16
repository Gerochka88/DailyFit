//
//  NotificationName.swift
//  Rolique
//
//  Created by Bohdan Savych on 11/2/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import UIKit

protocol NotificationName {
    var name: Notification.Name { get }
}

extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
            return Notification.Name(self.rawValue)
    }
}

enum Notifications: String, NotificationName {
    case reset,
    languageWillChange,
    languageDidChange
}
