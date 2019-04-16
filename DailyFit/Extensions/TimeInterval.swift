//
//  TimeInterval.swift
//  Rolique
//
//  Created by Bohdan Savych on 8/18/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import Foundation

extension TimeInterval {
    static var minute: TimeInterval {
        return 60
    }
    
    static var hour: TimeInterval {
        return minute * 60
    }
    
    static var day: TimeInterval {
        return hour * 24
    }
    
    static var week: TimeInterval {
        return day * 7
    }
    
    static var notLeapYear: TimeInterval {
        return day * 365
    }
    
    static var leapYear: TimeInterval {
        return day * 366
    }
}
