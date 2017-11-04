//
//  ViewInspectable.swift
//  TB
//
//  Created by Jonas Deichelmann on 24.09.17.
//  Copyright © 2017 JonasDeichelmann. All rights reserved.
//

import Foundation


// - MARK: EX View Inspectable: cornerRadius, borderWidth, borderColor

@IBDesignable
extension UIView
{
    @IBInspectable
    public var cornerRadius: CGFloat
    {
        set (radius) {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = radius > 0
        }
        get {
            return self.layer.cornerRadius
        }
    }

    @IBInspectable
    public var borderWidth: CGFloat
    {
        set (borderWidth) {
            self.layer.borderWidth = borderWidth
        }

        get {
            return self.layer.borderWidth
        }
    }

    @IBInspectable
    public var borderColor:UIColor?
    {
        set (color) {
            self.layer.borderColor = color?.cgColor
        }

        get {
            if let color = self.layer.borderColor
            {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
}
