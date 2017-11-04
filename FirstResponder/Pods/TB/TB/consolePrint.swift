//
//  consolePrint.swift
//  TB
//
//  Created by Jonas Deichelmann on 11.09.17.
//  Copyright © 2017 JonasDeichelmann. All rights reserved.
//

import Foundation

//Function to print info
/// info-function to print informations
public func info(_ message: String, function: String = #function, line: Int = #line ) {
    print("Info: \(message) called from \(function) Line:\(line)")
}

// Function to print warning
///Warning function to print warnings, when needed in the coded
public func warn(_ message: String, file: String = #file, function: String = #function, line: Int = #line ) {
    print("WARNING: \"\(message)\" called from \(function) \(file):\(line)")
}

//Function to print temp
///function to print-temporary messages, for ex. to debug
public func temp(_ message: String, function: String = #function, line: Int = #line ) {
    print("Temp: \"\(message)\" called from \(function) in line:\(line)")
}

//Function to print error
///Error function to print errors
public func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line ) {
    print("ERROR: \"\(message)\" called from \(function) \(file):\(line)")
}
