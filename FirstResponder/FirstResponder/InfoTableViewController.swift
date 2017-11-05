//
//  InfoTableViewController.swift
//  FirstResponder
//
//  Created by Simon Nielsen on 04/11/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class InfoTableViewController: UITableViewController{

  
    var infoData = InfoData.generateInfoData()
    
}

extension InfoTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData.count
    }
    
       // cell.titleLbl?.text = info.title
        //cell.detailLbl?.text = info.descript
        //cell.textLbl?.text = info.text
   
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell",
                                                 for: indexPath) as! InfoCell
        
        let info = infoData[indexPath.row]
        cell.titleLbl.text = info.title
        cell.detailLbl.text = info.descript
        
        
        return cell
    }

}

