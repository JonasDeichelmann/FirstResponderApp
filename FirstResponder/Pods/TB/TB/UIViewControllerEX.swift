//
//  UiViewControllerEX.swift
//  TB
//
//  Created by Jonas Deichelmann on 28.09.17.
//  Copyright © 2017 JonasDeichelmann. All rights reserved.
//

import Foundation


public extension UIViewController {

    //- MARK: hideKeyboardWhenTappedAround
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
