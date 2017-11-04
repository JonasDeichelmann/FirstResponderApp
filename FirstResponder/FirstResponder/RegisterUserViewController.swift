//
//  RegisterUserViewController.swift
//  FirstResponder
//
//  Created by Ronny Håland on 11/4/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import TB

class RegisterUserViewController: UIViewController {
    
    @IBOutlet weak var userField:UITextField!
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func register(){
        if userField.text != nil && emailField.text != nil && passField.text != nil {
            let user = userField.text!
            if !user.isUserName {
                return
            }
            let email = emailField.text!
            if !email.isEmail {
                return
            }
            
            let pass = passField.text!
            if pass.length < 8 {
                return
            }
            
            let requestURL = "http://174.129.62.164/api/register"
            let APIKey = "03afc455-5170-42af-b83e-6b65358c0bea"
            let JSONBody:[String: Any] = [
                "key":APIKey,
                "userdata":[
                    "name":user,
                    "email":email,
                    "password":pass
                ]
            ];
            TB.info("sending request")
            Alamofire.request(requestURL, method: HTTPMethod.post, parameters: JSONBody, encoding: JSONEncoding.default, headers: nil).validate().response { response in
                print(response)
            }
            TB.info("Sent Request")
            // ip/api/register
            
            
        }
        
        // TODO: Pass data to server
    }
    @IBAction func cancel(){
        
        // TODO: Goto login viewcontroller
    }

}

