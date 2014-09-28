//
//  NewEntryViewController.swift
//  mindfulness journal
//
//  Created by Chris Barker on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol NewEntryDelegate {
    func newJournalEntry(text: String, creationTime: String)
}

class NewEntryViewController: UIViewController {

    
    var delegate: NewEntryDelegate!
    var newEntry : JournalEntry!
    var tapRecognizer : UITapGestureRecognizer!
    
    func getPrompt() -> String {
        return "";
    }
    
    var journalContents : String = ""
    
    var journalCreationTime : String = ""
    
    func setCreationTime() -> Void {
        self.journalCreationTime = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    }

    func tapped(sender: UIGestureRecognizer) {
        self.finalizeText()
        
    }
    
    func finalizeText() {
        // Finalize any text fields
        fatalError("This method must be overridden")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tapRecognizer = UITapGestureRecognizer()
        self.view.addGestureRecognizer(self.tapRecognizer)
        self.tapRecognizer.addTarget(self,  action: "tapped:")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
