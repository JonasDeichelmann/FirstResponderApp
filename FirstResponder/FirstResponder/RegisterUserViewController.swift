//
//  RegisterUserViewController.swift
//  FirstResponder
//
//  Created by Ronny Håland on 11/4/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import TB
import Alamofire

class RegisterUserViewController: UIViewController {
    
    @IBOutlet weak var userField:UITextField!
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func register(){
        if let user = userField.text {
            if !user.isUserName {
                return
            }
        }
        if let email = emailField.text {
            if !email.isEmail {
                return
            }
        }
        if let password = passField.text {
            if password.length < 8 {
                return
            }
        }
        
        
        // TODO: Pass data to server
    }
    @IBAction func cancel(){
        
        // TODO: Goto login viewcontroller
    }

}

