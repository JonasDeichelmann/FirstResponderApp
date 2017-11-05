//
//  InfoCell.swift
//  FirstResponder
//
//  Created by SImon Nielsen on 05/11/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet var infoTableView: UITableView!
    @IBOutlet var detailLbl: UILabel!
    @IBOutlet var textLbl: UILabel!
    @IBOutlet var titleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
