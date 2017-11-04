//
//  LoginViewController.swift
//  FirstResponder
//
//  Created by Jonas Deichelmann on 03.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import TB
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var userField:UITextField!
    @IBOutlet weak var passField:UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func login() {
        if userField.text != nil && passField.text != nil {
            
            let requestURL = "http://174.129.62.164/api/login"
            let APIKey = "03afc455-5170-42af-b83e-6b65358c0bea"
            let user = userField.text!
            let pass = passField.text!
            let JSON:[String: Any] = [
                "key": APIKey,
                "userdata": [
                    "name" : user,
                    "pass" : pass
                ]
            ]
            
            Alamofire.request(requestURL, method: HTTPMethod.post, parameters: JSON, encoding: JSONEncoding.default, headers: nil).response { response in
                    print(response)
            }
        }
    }

}
