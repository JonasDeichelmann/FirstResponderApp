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
import SwiftyPlistManager
import Toast_Swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userField:UITextField!
    @IBOutlet weak var passField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func login() {
        if userField.text != nil && passField.text != nil {
            
            let requestURL = "http://34.232.174.236/api/login/"
            let APIKey = ""
            let user = userField.text!
            let pass = passField.text!
            let JSON:[String: Any] = [
                "key": APIKey,
                "username" : user,
                "password" : pass
                
            ]
            self.view.makeToastActivity(.center)
            
            Alamofire.request(requestURL, method: HTTPMethod.post, parameters: JSON, encoding: JSONEncoding.default).responseString { response in
                
                SwiftyPlistManager.shared.save(response.result.value!, forKey: "userID", toPlistWithName: "Data") { (err) in
                    if err == nil {
                        print("Value successfully saved into plist.")
                    }
                }
                SwiftyPlistManager.shared.getValue(for: "userID", fromPlistWithName: "Data") { (result, err) in
                    if err == nil {
                        print("The Value is: '\(result ?? "No Value Fetched")'")
                    }
                }
                DispatchQueue.main.async {
                    self.view.hideToastActivity()
                    self.performSegue(withIdentifier: "loginSuccess", sender: nil)
                }
            }
        }
    }
    
}
