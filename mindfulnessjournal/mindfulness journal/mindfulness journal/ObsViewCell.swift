//
//  ObsViewCell.swift
//  mindfulness journal
//
//  Created by Chris Barker on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol ObsViewCellDelegate {
    func configureObservation(id: Int, descriptor: String, rating: Int) -> Void
    
}

class ObsViewCell: UITableViewCell {
    
    var delegate: ObsViewCellDelegate?
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
    }
    
    @IBAction func observationIdentifierTap(sender: AnyObject) {
    }
    
    @IBOutlet var observationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
