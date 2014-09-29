//
//  ObsViewCell.swift
//  mindfulness journal
//
//  Created by Chris Barker on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol ObsViewCellDelegate {
    func updateObs(Observation) -> Void
}

class ObsViewCell: UITableViewCell {
    
    var delegate: ObsViewCellDelegate?
    var id: Int?
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        self.update()
    }
    
    @IBAction func observationIdentifierTap(sender: AnyObject) {
        self.update()
    }
    
    @IBAction func intensitySwitchChanged(sender: AnyObject) {
        self.update()
    }
    
    @IBOutlet var observationButton: UIButton!
    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var intensitySwitch: UISwitch!
    @IBOutlet var intensityLabel: UILabel!
    
    func getIntensity() -> Int? {
        if (self.intensitySwitch.on) {
            return Int(UIKit.floor(self.sliderOutlet.value * 10))
        } else {
            return nil
        }
    }
    
    func getId() -> Int {
        return self.id!
    }
    
    func getDescriptor() -> String {
        return self.observationButton.titleLabel!.text!
    }
    
    func constructObservation() -> Observation {
        return Observation(id: self.getId(), descriptor: self.getDescriptor(), intensity: self.getIntensity())
    }
    
    func updateIntensityLabel() {
        let intensity = self.getIntensity()
        if (intensity == nil) {
            self.intensityLabel.text = ""
        } else {
            self.intensityLabel.text = String(intensity!) + "/10"
        }
    }
    
    func updateIntensitySlider() {
        self.sliderOutlet.enabled = self.intensitySwitch.on
    }
    
    func updateLocal() {
        self.updateIntensityLabel()
        self.updateIntensitySlider()
    }
    
    /* Update locally and upstream */
    func update() {
        self.updateLocal()
        self.sendupdate()
    }
    
    /* Tell delegate we want to update our value */
    func sendupdate() {
        delegate!.updateObs(self.constructObservation())
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(observation: Observation) {
        let id = observation.id
        let intensity = observation.intensity
        let descriptor = observation.descriptor
        
        self.id = id
        self.observationButton.setTitle(descriptor, forState: UIControlState.Normal)
        if (intensity == nil) {
            self.intensitySwitch.on = false
            self.sliderOutlet.enabled = false
        } else {
            self.intensitySwitch.on = true
            self.sliderOutlet.enabled = true
            self.sliderOutlet.value = (Float(intensity!) / 10)
        }
        self.updateLocal()
    }

}
