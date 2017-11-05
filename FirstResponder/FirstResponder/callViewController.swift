
import Foundation
import UIKit

class callViewController: UITableViewController{
    
    @IBOutlet var viewModel: UITableView!
    
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
