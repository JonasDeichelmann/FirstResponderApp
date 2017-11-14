
import Foundation
import UIKit
import CoreLocation
import MapKit
import TB
import Alamofire
import SwiftyPlistManager

class callViewController: UITableViewController, CLLocationManagerDelegate{
    
    @IBOutlet var viewModel: UITableView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    let time = ["2 minutes ago", "7 minutes ago"]
    let dateLog = ["11:12PM October 3rd, 2017", "02:30AM January 1st, 2017"]
    
    
    lazy var mySections: [SectionData] = {
        let section1 = SectionData(title: "Urgent Calls", data: ["Vineyard Suites, Parking Lot", "Otter Gym, Inter-Garrison Rd."], subtitle: ["2 minutes ago", "7 minutes ago"])
        let section2 = SectionData(title: "Call log", data: ["11:12PM October 3rd, 2017", "02:30AM January 1st, 2017"], subtitle: [])
        let section3 = SectionData(title: "Profile", data: ["Anders Andersen", "Vineyard Suites, 131", "anders@internet.com"], subtitle: [])
        let section4 = SectionData(title: "Certificates", data: ["CPR", "First Aid", "Paramedic"], subtitle: [])
        
        return [section1, section2, section3, section4]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return mySections[section].title
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySections[section].numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTitle = mySections[indexPath.section][indexPath.row]
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell", for: indexPath)
        cell.textLabel?.text = cellTitle
            return cell
        }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            TB.info("If status has not yet been determied, ask for authorization")
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            sendCurrentLocation()
            TB.info("If authorized when in use")
            break
        case .authorizedAlways:
            sendCurrentLocation()
            TB.info("If always authorized")
            break
        case .restricted:
            TB.info("If restricted by e.g. parental controls. User can't enable Location Services")
            break
        case .denied:
            TB.info("If user denied your app access to Location Services, but can grant access from Settings.app")
            break
        }
    }
    func sendCurrentLocation(){

        locationManager.startUpdatingLocation()
        let loc = locationManager.location
        var lat = 0.0
        var long = 0.0
        if loc?.coordinate.latitude != nil{
            lat = Double((loc?.coordinate.latitude)!)
        }
        if loc?.coordinate.longitude != nil{
            long = Double((loc?.coordinate.longitude)!)
        }
        sendLocation(lat: lat, long: long)

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        TB.info("Locations Did Updated")
            sendLocation(lat: (locations.last?.coordinate.latitude)!, long: (locations.last?.coordinate.longitude)!)
    }
    func sendLocation(lat: Double, long: Double){
        var userID = "1"
        SwiftyPlistManager.shared.getValue(for: "userID", fromPlistWithName: "Data") { (result, err) in
            if err == nil {
                TB.info("The UserID is: '\(result ?? "No Value Fetched")'")
                userID = result as! String
            }
        }
        if userID == ""{
            userID = "1"
        }
        let parameters: [String: Any] = [
            "key" : "03afc455-5170-42af-b83e-6b65358c0bea",
            "userID" : userID,
            "coordination":[
                "latitude" : lat,
                "longitude": long,
            ],
            "currentDate" : String(describing: Date())
        ]
        TB.temp("\(parameters)")
        Alamofire.request("http://34.232.174.236/api/update/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseString { response in
                TB.info("\(response)")
        }
    }
}

struct SectionData {
    let title: String
    let data : [String]
    let subtitle : [String]?
    
    var numberOfItems: Int {
        return data.count
    }
    
    subscript(index: Int) -> String {
        return data[index]
    }
  }

extension SectionData {
    init(title: String, data: [String], subtitle:[String]) {
        self.title = title
        self.data  = data
        self.subtitle = subtitle
    }}
