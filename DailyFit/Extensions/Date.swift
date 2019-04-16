//
//  Date.swift
//  Rolique
//
//  Created by Bohdan Savych on 8/15/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import UIKit

extension Date {
    var mondayOfWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        components.weekday = 2
        return calendar.date(from: components)!
    }
    
    var normalized: Date {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.day, .month, .year], from: self)
        let date = calendar.date(from: components)!

        return date
    }
    
    var sundayOfWeek: Date {
        let calendar = Calendar.current
        
        var components = calendar.dateComponents([.day, .month, .year], from: mondayOfWeek)
        components.day = (components.day.orZero) + 6
        let date = calendar.date(from: components)!
        
        return date
    }
    
    var weekFriday: Date {
        let calendar = Calendar.current
        
        var components = calendar.dateComponents([.day, .month, .year], from: mondayOfWeek)
        components.day = (components.day.orZero) + 4
        let date = Calendar.current.date(from: components)!
        
        return date
    }
    
    var startOfDay: Date {
        let calendar = Calendar.current

        return calendar.date(from: calendar.dateComponents([.year, .month, .day], from: self))!
    }
    
    static func getDates(from range: ClosedRange<Date>, with dayStep: Int = 1) -> [Date] {
        let calendar = Calendar.current
        var dates = [range.lowerBound]
        let units = Set<Calendar.Component>([.day, .month, .year])
        let components = calendar.dateComponents(units, from: range.lowerBound)
        var acc = dayStep
        
        while true {
            var tmpComponents = components
            tmpComponents.day = (components.day.orZero) + acc
            let date = calendar.date(from: tmpComponents)!
            
            if date < range.upperBound {
                dates.append(date)
            } else {
                dates.append(range.upperBound)
                break
            }
            
            acc += dayStep
        }
        
        return dates
    }
}
