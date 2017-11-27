//
//  annotationClass.swift
//  FirstResponder
//
//  Created by Jonas Deichelmann on 26.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    var color: MKPinAnnotationColor = MKPinAnnotationColor.purple
}
