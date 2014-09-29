//
//  TodaysEntriesTableViewController.swift
//  mindful
//
//  Created by Chris Barker on 9/28/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

struct JournalEntry {
    var journalText : String
    var creationTime : String
}

class TodaysEntriesTableViewController: UITableViewController, NewEntryDelegate, JournalEntryDelegate {

    func newJournalEntry(text: String, creationTime: String) {
        self.entries.append(JournalEntry(journalText: text, creationTime: creationTime))
    }
    
    var entries: [JournalEntry] = []
    
    var currIndex : Int!
    
    var currDate : String!
    
    var currEntry : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    func editEntry(newText: String, index: Int, originalDate : String) {
        self.entries[index].journalText = newText
        var indicesToReload: [AnyObject] = [NSIndexPath(forRow: index, inSection: 0)]
        self.tableView.reloadRowsAtIndexPaths(indicesToReload, withRowAnimation: UITableViewRowAnimation.Fade)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the numberof rows in the section.
        return self.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("entry") as? NewJournalCellTableViewCell ?? NewJournalCellTableViewCell()
        var newEntry = self.entries[indexPath.row]
        cell.journalName.text = newEntry.creationTime + ": " + newEntry.journalText
        self.currIndex = indexPath.row
        self.currDate = newEntry.creationTime
        self.currEntry = newEntry.journalText
        return cell

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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        println("Segueing from todaysEntries")
        switch segue.identifier {
        case "prompt", "blank":
            var newEntryViewController = segue.destinationViewController as?
            NewEntryViewController
            newEntryViewController?.delegate = self
            newEntryViewController?.setCreationTime()
            break
        case "editEntry":
            var journalEntryViewController = segue.destinationViewController as? JournalEntryViewController
            journalEntryViewController?.delegate = self
            journalEntryViewController?.index = self.currIndex
            journalEntryViewController?.date = self.currDate
            journalEntryViewController?.text = self.currEntry
            break
            
            
        default:
            break
            
        }
    }

}
