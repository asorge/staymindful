//
//  NewGoalViewController.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/27/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

protocol NewGoalDelegate {
    func newGoal(text: String, date: String)
}

class NewGoalViewController: UIViewController {
    
    var delegate: NewGoalDelegate!

    @IBOutlet var newGoalText: UITextField!
    
    @IBOutlet var goalDate: UILabel!
    
    var goalCreationTime : String = ""
    
    @IBAction func doneButton(sender: AnyObject) {
        delegate!.newGoal(newGoalText.text, date: goalDate.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func setCreationTime() -> Void {
        goalCreationTime = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCreationTime()
        goalDate.text = goalCreationTime

        // Do any additional setup after loading the view.
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
