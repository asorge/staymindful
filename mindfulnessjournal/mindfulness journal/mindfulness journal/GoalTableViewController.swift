//
//  GoalTableViewController.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

struct Goal {
    var goalText : String
    var date : String
}

class GoalTableViewController: UITableViewController, NewGoalDelegate {
    
    var goals : [Goal] = []
    
    func newGoal(text: String, date: String) {
        self.goals.append(Goal(goalText: text, date: date))
        /*var dick : NSIndexPath
        dick = NSIndexPath(forRow: self.goals.count-1, inSection: 0)
        let indexToInsert : [AnyObject] = [dick]
        self.tableView.insertRowsAtIndexPaths(indexToInsert, withRowAnimation: UITableViewRowAnimation.Fade)*/
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("goal") as? GoalTableViewCell ?? GoalTableViewCell()
        var newGoal = self.goals[indexPath.row]
        cell.goalText.text = newGoal.goalText
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if (segue == nil) {
            return
        }
        var newGoalViewController = segue!.destinationViewController as?
        NewGoalViewController
        newGoalViewController?.delegate = self
        newGoalViewController?.setCreationTime()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
