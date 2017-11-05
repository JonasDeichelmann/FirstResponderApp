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
import TB

class InfoTableViewController: UITableViewController{


    var infoData = InfoData.generateInfoData()
    var url : String?
    @IBOutlet var viewModel: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        TB.temp("")
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData.count
    }



    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        TB.info("\(cell)")
        let info = infoData[indexPath.row]
        //        cell.titleLbl.text = info.title
        //        cell.detailLbl.text = info.descript
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.descript
        url = info.url
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueInfo" {

        }
    }
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if indexPath.row ==  1{
            performSegue(withIdentifier: "segueInfo", sender: self)
        } else {
            if let youtubeVideo = url {
                UIApplication.shared.openURL(URL(string: youtubeVideo)!)
            }
            
            
        }
    }}
