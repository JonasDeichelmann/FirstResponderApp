//
//  AEDMapViewController.swift
//  FirstResponder
//
//  Created by Simon Nielsen on 04/11/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import TB
import SwiftyPlistManager


class AEDMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var x : Float?
    var y : Float?
    var name : String?
    var desc : String?

    let initialLocation = CLLocation(latitude: 36.654775, longitude: -121.800588)

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    var locations = [CLLocation]()
    var pin1 = CLLocation(latitude: 36.654025, longitude: -121.798923)
    var pin2 = CLLocation(latitude: 36.654131, longitude: -121.799873)
    var pin4 = CLLocation(latitude: 36.652481, longitude: -121.797352)
    var pin5 = CLLocation(latitude: 36.652480, longitude: -121.797351)
    var pin6 = CLLocation(latitude: 36.655320, longitude: -121.800523)
    var pin7 = CLLocation(latitude: 36.655199, longitude: -121.795516)
    var pin8 = CLLocation(latitude:  36.654293, longitude: -121.801766)
    var pin9 = CLLocation(latitude:  36.652636, longitude: -121.796141)
    var pin10 = CLLocation(latitude:  36.655812, longitude: -121.807174)
    var pin11 = CLLocation(latitude:  36.654293, longitude: -121.801766)
    var pin12 = CLLocation(latitude:  36.654293, longitude: -121.801766)



    func loadToMap(){

        self.locations.append(pin1)
        self.locations.append(pin2)
        self.locations.append(pin4)
        self.locations.append(pin5)
        self.locations.append(pin6)
        self.locations.append(pin7)
        self.locations.append(pin8)
        self.locations.append(pin9)
        self.locations.append(pin10)
        self.locations.append(pin11)
        self.locations.append(pin12)


        mapView.showAnnotations(self.locations as! [MKAnnotation], animated: true)

    }



    // Remove values if the array is too big

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadToMap()
    }

    override func viewDidAppear(_ animated: Bool) {



        SwiftyPlistManager.shared.getValue(for: "userID", fromPlistWithName: "Data") { (result, err) in
            if err == nil {
                if result != nil{
                checkForInjury("03afc455-5170-42af-b83e-6b65358c0bea", userID: result as! String) { coords  in
                    let lat = coords?.getLatitude()
                    let lon = coords?.getLongitude()
                    let urgentPin = CLLocation(latitude: lat!, longitude: lon!)
                    self.locations.append(urgentPin)
                    }
                }
            }
        }


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
