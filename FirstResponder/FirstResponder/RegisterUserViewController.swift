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
import SwiftyPlistManager
import Toast_Swift

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
            let token = "testtoken123123"
            let parameters: [String: Any] = [
                "key" : "03afc455-5170-42af-b83e-6b65358c0bea",
                "userdata":[
                    "name" : user,
                    "password": pass,
                    "devicetoken": token
                ],
                "ignored":1
            ]
            self.view.makeToastActivity(.center)
            Alamofire.request("http://174.129.62.164/api/register/", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseString { response in
                print(response)
                print(response.result)
                
                //MARK: - IF USER REGISTERED
                if response.result.isSuccess {
                    
                    let requestURL = "http://174.129.62.164/api/login/"
                    let APIKey = "03afc455-5170-42af-b83e-6b65358c0bea"
                    
                    let JSON:[String: Any] = [
                        "key": APIKey,
                        "username" : user,
                        "password" : pass
                        
                    ]
                    //MARK: - Try to log in
                    Alamofire.request(requestURL, method: HTTPMethod.post, parameters: JSON, encoding: JSONEncoding.default).responseString { response in
                        if response.result.isSuccess {
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
                                self.performSegue(withIdentifier: "registerSuccess", sender: nil)
                            }
                        }else {
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "toLogin", sender: nil)
                            }
                        }
                    }
                }
                
            }
            TB.info("Sent Request")
        }
    }
    @IBAction func cancel(){
        
        // TODO: Goto login viewcontroller
    }
    
}
