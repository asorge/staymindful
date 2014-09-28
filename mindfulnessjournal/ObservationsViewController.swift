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
    var intensity: String
}

class ObservationsViewController: UIViewController, ObsViewCellDelegate, NewObsCellDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var observations: [Observation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.observations = []

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return self.observations.count + 1
        default:
            return 0
        }
    }
    
    func submitNewObservation(obsText: String, intensity: String) {
        var indicesToReload: [AnyObject] = [NSIndexPath(forRow: self.observations.count, inSection: 0)]
        var indicesToInsert: [AnyObject] = [NSIndexPath(forRow: self.observations.count+1, inSection: 0)]
        
        let obs : Observation = Observation(id: 0, descriptor: obsText, intensity: intensity)
        self.observations.append(obs)
        
        self.tableView.insertRowsAtIndexPaths(indicesToInsert, withRowAnimation: UITableViewRowAnimation.Fade)
        self.tableView.reloadRowsAtIndexPaths(indicesToReload, withRowAnimation: UITableViewRowAnimation.Fade)
    }

    @IBAction func newObservationPressed(sender: AnyObject) {
        var alert = UIAlertController(title: "I observe:", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
            
            println(alert.title)
        }))
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Observation"
        })
        self.presentViewController(alert, animated: true, completion: {})
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row == self.observations.count) {
            // "create new" cell
            var cell = self.tableView.dequeueReusableCellWithIdentifier("createNewObservationCell") as? NewObsCell ?? NewObsCell()
            cell.delegate = self
            return cell
        } else {
            // get an observation item
            var cell = self.tableView.dequeueReusableCellWithIdentifier("observationCell") as? ObsViewCell ?? ObsViewCell()
            cell.delegate = self
            return cell
        }
    }
    

    
    func configureObservation(id: Int, descriptor: String, rating: Int) {
        // find observation with matching id and change the values given
    }
    
    func addCell() {
        println("bitches")
        // segue to an addCell modal
    }

}
