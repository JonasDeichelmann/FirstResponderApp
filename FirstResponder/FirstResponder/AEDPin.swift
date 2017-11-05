//
//  AEDPin.swift
//  FirstResponder
//
//  Created by SImon Nielsen on 04/11/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AEDPin {
    
    var author: String!
    var descript: String!
    var x: Float!
    var y: Float!
    
    
    init(json: JSON) {
        self.descript = json["description"].string
        self.author = json["author"].string
        self.x = json["x"].float
        
        self.y = json["descript"].float
    
    }}
