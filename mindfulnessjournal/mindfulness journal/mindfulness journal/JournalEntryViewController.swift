//
//  JournalEntryViewController.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/25/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol JournalEntryDelegate {
    func editEntry(newText: String, index: Int, originalDate : String)
}

class JournalEntryViewController: UIViewController {
    
    var delegate : JournalEntryDelegate!
    
    var index: Int!
    
    var text : String!
    
    var date : String!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var journalText: UITextField!

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func shareButton(sender: AnyObject) {
        
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        var newText : String = self.journalText.text
        println(newText)
        delegate!.editEntry(newText, index: self.index, originalDate: self.dateLabel.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateLabel.text = self.date
        self.journalText.text = self.text
        

        // Do any additional setup after loading the view.
    }
    
    func finalizeText() {
        self.journalText.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
