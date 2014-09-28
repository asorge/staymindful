//
//  ObservationsViewController.swift
//  mindfulness journal
//
//  Created by Chris Barker on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

struct Observation {
    var id: Int
    var descriptor: String
    var rating: Int
}

class ObservationsViewController: UIViewController, ObservationsTableViewDelegate,  {

    @IBOutlet var tableView: ObservationsTableView!
    var observations: [Observation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.obsDelegate! = self
        self.observations = []

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections() -> Int {
        return 2;
    }
    
    func numberOfRowsInSection(sectionId: Int) -> Int {
        switch (sectionId) {
        case 0:
            return self.observations.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        switch (indexPath.section) {
        case 0:
            // get an observation item
            var cell = self.tableView.dequeueReusableCellWithIdentifier("observationCell") as? ObsViewCell ?? ObsViewCell()
            cell.delegate! = self
            return cell
        case 1:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("createNewObservationCell") as? NewObsCell ?? NewObsCell()
            //cell.delegate! = self
            break
        default:
            return nil
        }
    }
    
    func configureObservation(id: Int, descriptor: String, rating: Int) {
        // find observation with matching id and change the values given
    }

}
