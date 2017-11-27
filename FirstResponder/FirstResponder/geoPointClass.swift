//
//  geoPointClass.swift
//  FirstResponder
//
//  Created by Jonas Deichelmann on 26.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation

class geopoint{
    var len:Double
    var lat:Double
    
    init(latitude: Double, longitude: Double) {
        self.len = longitude
        self.lat = latitude
    }
    func getLongitude() -> Double {
        return self.len
    }
    func getLatitude() -> Double {
        return self.lat
    }
}
