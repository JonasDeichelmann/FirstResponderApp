//
//  UIViewEX.swift
//  TB
//
//  Created by Jonas Deichelmann on 23.09.17.
//  Copyright © 2017 JonasDeichelmann. All rights reserved.
//

import Foundation

// - MARK: EX UIView: setFrameSize, setFrameHeight, setFrameWidth, setFrameOriginX, setFrameOriginY, setFrameMaxX, setFrameMaxY, centerTo
extension UIView {

    func setFrameSize(_ size: CGSize) {
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }

    func setFrameHeight(_ height: CGFloat) {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }

    func setFrameWidth(_ width: CGFloat) {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }

    func setFrameOriginX(_ originX: CGFloat) {
        var frame = self.frame
        frame.origin.x = originX
        self.frame = frame
    }

    func setFrameOriginY(_ originY: CGFloat) {
        var frame = self.frame
        frame.origin.y = originY
        self.frame = frame
    }

    func setFrameMaxX(_ maxX: CGFloat) {
        setFrameOriginX(maxX - frame.width)
    }

    func setFrameMaxY(_ maxY: CGFloat) {
        setFrameOriginY(maxY - frame.height)
    }

    /**
     set current view's absolute center to other view's center

     - parameter view: other view
     */
    func centerTo(_ view: UIView) {
        self.frame.origin.x = view.bounds.midX - self.frame.width / 2
        self.frame.origin.y = view.bounds.midY - self.frame.height / 2

    }
}

// - MARK: EX: UIView maxSize, minSize, maxBounds, minBounds
extension UIView {

    var _maxSize: CGSize {
        let maxL = max(frame.width, frame.height)
        return CGSize(width: maxL, height: maxL)
    }

    var _minSize: CGSize {
        let minL = min(frame.width, frame.height)
        return CGSize(width: minL, height: minL)
    }

    var _maxBounds: CGRect {
        return CGRect(origin: .zero, size: _maxSize)
    }

    var _minBounds: CGRect {
        return CGRect(origin: .zero, size: _minSize)
    }
}



