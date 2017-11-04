//
//  RegisterUserViewController.swift
//  FirstResponder
//
//  Created by Ronny Håland on 11/4/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import Alamofire
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
            if pass.characters.count < 8 {
                return
            }
            let JSONBody:[String: Any] = [
                "key" : "03afc455-5170-42af-b83e-6b65358c0bea",
                "userdata":[
                    "name":user,
                    "email":email,
                    "password":pass
                ]
            ]
            TB.info("sending request")
            
            Alamofire.request("http://174.129.62.164/api/smile/", method: .post, parameters: JSONBody).responseString { response in
                print(response)
                let success = (response.result.value! == ":)")
                if success {
                    DispatchQueue.main.async {
                        
                        //present(, animated: true, completion: nil)
                    }
                }
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
