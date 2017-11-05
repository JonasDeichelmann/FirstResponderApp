//
//  Singelton.swift
//  FirstResponder
//
//  Created by Jonas Deichelmann on 04.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation


class Singelton: NSObject {

    // MARK: - Shared Instance

    static let shared: Singelton = {
        let instance = Singelton()
        // setup code
        return instance
    }()

    // MARK: - Initialization Method

    override init() {
        super.init()
    }

    // MARK: - Properties

    var deviceToken = ""

    var TokenID : String
    {
        get {
            return deviceToken
        }
        set(setToken) {
            deviceToken = setToken
        }
    }
}
