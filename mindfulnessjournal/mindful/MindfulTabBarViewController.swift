//
//  MindfulTabBarViewController.swift
//  mindful
//
//  Created by Chris Barker on 9/28/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

class MindfulTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        println("segueing from tab bar controller")
    }

}
