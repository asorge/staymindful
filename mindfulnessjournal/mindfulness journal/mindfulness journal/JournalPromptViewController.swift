//
//  JournalPromptViewController.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/25/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

class JournalPromptViewController: NewEntryViewController {

    @IBOutlet var journalText: UITextField!
    
    
    @IBAction func doneButtonPress(sender: AnyObject) {
        delegate!.newJournalEntry(journalText!.text, creationTime: self.journalCreationTime)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func finalizeText() {
        self.journalText.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
