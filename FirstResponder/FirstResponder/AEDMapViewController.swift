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



class AEDMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var x : Float?
    var y : Float?
    var name : String?
    var desc : String?
    
    let initialLocation = CLLocation(latitude: 36.654775, longitude: -121.800588)
    // key 2729a7acf486c6305eeb2f627b8c613e20980a28
    

    
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
     func getAEDPins(handler: @escaping (Array<AEDPin>?) -> ()) {
        Alamofire.request(
            "https://paloalto.cloudapi.junar.com/api/v2/datastreams/AED-LOCAT-99951/data.json/?auth_key=2729a7acf486c6305eeb2f627b8c613e20980a28&limit=100"
            )
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching jsondata")
                    return
                }
                
                guard let responseJSON = response.result.value else {
                    print("Invalid jsondata received from the server")
                    return
                }
                
                var pins: Array<AEDPin> = []
                let json = response.result
                //print(json)
                
                json.forEach{(_, json) in
                    print(json)
                    pins.append(AEDPin(json: json))
                    print(pins)
                }
                
                handler(pins)
        }
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        centerMapOnLocation(location: initialLocation)
        getAEDPins{ (pins: Array<AEDPin>?) in
           // if let data = pins?[]() {
                
             //   print(data)
        //}
        }}

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
