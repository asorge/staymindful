//
//  EntriesViewController.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/25/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

// subscribe to blank and journal prompt delegates to update new entries here

struct JournalEntry {
    var journalText : String
    var creationTime : String
}

class EntriesTableViewController: UITableViewController, NewEntryDelegate  {

    @IBAction func blankButton(sender: UIBarButtonItem) {
        
    }
    
    @IBAction func promptButton(sender: UIBarButtonItem) {
        
    }
    
    func newJournalEntry(text: String, creationTime: String) {
        self.entries.append(JournalEntry(journalText: text, creationTime: creationTime))
    }
    
    var entries: [JournalEntry] = []
    
    @IBAction func unwindToSegue (segue : UIStoryboardSegue) {
        // Called when coming back from a segue
        /*
        var sourceOne: BlankJournalViewController = segue.sourceViewController as BlankJournalViewController
        var newEntryOne = sourceOne.newEntry
        if newEntryOne != nil {
            entries.append(newEntryOne)
            self.reloadInputViews()
        }
        
        var sourceTwo: JournalPromptViewController = segue.sourceViewController as JournalPromptViewController
        var newEntryTwo = sourceTwo.newEntry
        if newEntryTwo != nil {
            entries.append(newEntryTwo)
            self.reloadInputViews()
        }*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.tableView.delegate = self;
       // self.tableView.dataSource = self;

        // Do any additional setup after loading the view.
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("entry") as? NewJournalCellTableViewCell ?? NewJournalCellTableViewCell()
        var newEntry = self.entries[indexPath.row]
        cell.journalName.text = newEntry.creationTime + ": " + newEntry.journalText
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if (segue == nil) {
            return
        }
        switch segue!.identifier {
            case "prompt", "blank":
                var newEntryViewController = segue!.destinationViewController as?
                    NewEntryViewController
                newEntryViewController?.delegate = self
                newEntryViewController?.setCreationTime()
                break
        default:
            break
            
        }
    }

}
