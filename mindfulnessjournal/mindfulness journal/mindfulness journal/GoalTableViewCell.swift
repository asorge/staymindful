//
//  GoalTableViewCell.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {

    @IBOutlet var goalText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
