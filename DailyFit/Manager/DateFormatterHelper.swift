//
//  DateFormatterHelper.swift
//  Rolique
//
//  Created by Bohdan Savych on 8/18/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import UIKit

enum DateFormatterType: String {
    case `default` = "yyyy-MM-dd HH:mm:ss ZZZZZ",
    weekDay = "EEEE",
    hourMinute = "HH:mm",
    ddMMyyyy = "dd/MM/yyyy",
    weekDayMonthDayHHmm = "EEE MMM d, HH:mm"
}

final class DateFormatterHelper {
    fileprivate static let formatter = DateFormatter()
    
    static func convertToDate(from string: String, with type: DateFormatterType = .default) -> Date? {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        formatter.dateFormat = type.rawValue
        
        return formatter.date(from: string)
    }
    
    static func convertToString(from date: Date, with type: DateFormatterType = .default) -> String {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        formatter.dateFormat = type.rawValue
        
        return formatter.string(from: date)
    }
}
