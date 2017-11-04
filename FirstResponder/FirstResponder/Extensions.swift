//
//  Extensions.swift
//  FirstResponder
//
//  Created by Ronny Håland on 11/4/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation

//MARK: - STRING EXTENSION
extension String{
    var isUserName:Bool{
        let s = self
        if s.length > 5 && s.length < 63 {
            return true
        }
        else {
            return false
        }
    }
    var isEmail:Bool{
        let s = self
        if s.length > 5 {
            var m = s.split(separator: "@")
            if m[0].count >= 1 && m[1].count >= 3{
                var d = m[1].split(separator: ".")
                if d[0].count >= 1 && d[1].count >= 1 {
                    return true
                }
            }
        }
        return false
        
    }
    
    var length:Int {
        return self.characters.count
    }
}
