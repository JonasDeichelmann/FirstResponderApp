//
//  Extensions.swift
//  FirstResponder
//
//  Created by Ronny Håland on 11/4/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

//MARK: - STRING EXTENSION
extension String{
    
    var length : Int{
        return self.characters.count
    }
    
    var isUserName:Bool{
        let s = self
        if s.characters.count > 5 && s.characters.count < 63 {
            return true
        }
        else {
            return false
        }
    }
    
    var isEmail : Bool {
        return true
    }
}

extension UIViewController{
    
    func checkForInjury(_ key:String, userID:String, completion: @escaping (geopoint?) -> Void) {
        let params:[String: Any] = [
            "key": key,
            "userID": userID
        ]
        var coords:geopoint?
        Alamofire.request("http://52.90.174.121/api/dest/", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
            if response.result.isSuccess {
                let obj = JSON(response.result.value!)
                if obj.count >= 2{
                    let lan = obj[1].double!
                    let lat = obj[0].double!
                    coords = geopoint(latitude: lat,longitude: lan)
                    completion(coords)
                } else {
                    print("Couldn't get coords")
                }
            } else {
                print("couldn't reach server!")
            }
        }
    }
}
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
