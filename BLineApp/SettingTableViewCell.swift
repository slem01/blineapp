//
//  SettingTableViewCell.swift
//  BLineApp
//
//  Created by Kylie Hausch on 4/9/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
