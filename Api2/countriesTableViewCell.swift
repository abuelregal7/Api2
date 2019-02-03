//
//  countriesTableViewCell.swift
//  Api2
//
//  Created by Ahmed abu elregal on 11/11/18.
//  Copyright © 2018 Ahmed abu elregal. All rights reserved.
//

import UIKit

class countriesTableViewCell: UITableViewCell {
    @IBOutlet weak var lableName: UILabel!
    @IBOutlet weak var lableLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
