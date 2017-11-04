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

    @IBOutlet weak var userField:UITextField?
    @IBOutlet weak var passField:UITextField?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func login() {
        
    }

}
