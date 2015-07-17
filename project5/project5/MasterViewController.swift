//
//  MasterViewController.swift
//  project5
//
//  Created by Ryan Gibbs on 17/07/2015.
//  Copyright © 2015 Ryan Gibbs. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var answers = [String]()
    var allWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            if let startWordsPath = NSBundle.mainBundle().pathForResource("start", ofType: "txt") {
                if let startWords = try NSString(contentsOfFile: startWordsPath, usedEncoding: nil) {
                    
                }
            }
        } catch {
            print("oops")
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = answers[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
}

