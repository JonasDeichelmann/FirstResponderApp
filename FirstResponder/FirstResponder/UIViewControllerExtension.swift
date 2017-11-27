//
//  UIViewControllerExtension.swift
//  FirstResponder
//
//  Created by Jonas Deichelmann on 26.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

extension UIViewController{
    
    func checkForInjury(_ key:String, userID:String, completion: @escaping (geopoint?) -> Void) {
        let params:[String: Any] = [
            "key": key,
            "userID": userID
        ]
        var coords:geopoint?
        Alamofire.request("http://34.232.174.236/api/dest/", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
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
