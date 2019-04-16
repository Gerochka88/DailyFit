//
//  CLLocationCoordinate2D.swift
//  Rolique
//
//  Created by Bohdan Savych on 10/17/17.
//  Copyright © 2017 Rolique. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    func distance(from location: CLLocationCoordinate2D) -> CLLocationDistance {
        let cllocation1 = CLLocation(latitude: latitude, longitude: longitude)
        let cllocation2 = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        return cllocation1.distance(from: cllocation2)
    }
}
