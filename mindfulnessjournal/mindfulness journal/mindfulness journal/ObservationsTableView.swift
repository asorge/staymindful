//
//  ObservationsTableView.swift
//  mindfulness journal
//
//  Created by Chris Barker on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol ObservationsTableViewDelegate {
    func numberOfSections() -> Int
    func numberOfRowsInSection(sectionId: Int) -> Int
    func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell?
}

class ObservationsTableView: UITableView {

    var obsDelegate : ObservationsTableViewDelegate?
    
    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        if (self.obsDelegate == nil) {
            return super.cellForRowAtIndexPath(indexPath)
        } else {
            return self.obsDelegate!.cellForRowAtIndexPath(indexPath)
        }
    }
    
    override func numberOfSections() -> Int {
        if (self.obsDelegate == nil) {
            return super.numberOfSections()
        } else {
            return self.obsDelegate!.numberOfSections()
        }
    }
    
    override func numberOfRowsInSection(section: Int) -> Int {
        if (self.obsDelegate == nil) {
            return super.numberOfRowsInSection(section)
        } else {
            return self.obsDelegate!.numberOfRowsInSection(section)
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
