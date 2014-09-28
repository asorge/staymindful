//
//  NewObsCell.swift
//  mindfulness journal
//
//  Created by Chris Barker on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol NewObsCellDelegate {
    func addCell() -> Void
    
}

class NewObsCell: UITableViewCell {
    
    var delegate: NewObsCellDelegate?

    @IBAction func NewObsPressed(sender: AnyObject) {
        if (delegate != nil) {
            delegate!.addCell()
        } else {
            fatalError("New observation cell has no delegate")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
