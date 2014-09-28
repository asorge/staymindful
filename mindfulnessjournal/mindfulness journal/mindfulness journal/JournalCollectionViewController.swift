//
//  JournalViewController.swift
//  mindfulness journal
//
//  Created by Ally Sorge on 9/25/14.
//  Copyright (c) 2014 Ally Sorge. All rights reserved.
//

import UIKit

struct JournalCollection {
    
}

class JournalCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var journalCollectionView: UICollectionView!
    
    var journalCollections :[JournalCollection] = []
    
    @IBOutlet var cellOne: JournalCollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        journalCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        journalCollectionView.dataSource = self
        journalCollectionView.delegate = self
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.journalCollections.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("JournalCollectionViewCell", forIndexPath: indexPath) as? JournalCollectionViewCell ?? JournalCollectionViewCell()
            cell.collectionCellName!.text = ""
        
        
        return cell
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
