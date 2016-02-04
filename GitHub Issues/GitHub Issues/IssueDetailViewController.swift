//
//  IssueDetailViewController.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/30/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var issueNameLabel: UILabel!
    @IBOutlet weak var posterIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    // declared optional because compiler complains that i don't have an initializer
    var url: String?
    
    
    //the issues object that comes from IssueTableViewController
    var issue: Issue?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// populate all the labels with values from the issue object passed from IssueTableViewController
        if let issue = issue {
            issueNameLabel.text = issue.issueName
            posterIDLabel.text = issue.posterID
            dateLabel.text = issue.date
            statusLabel.text = issue.status
            bodyLabel.text = issue.body
            url = issue.url
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Action
    
    @IBAction func seeIssueOnWeb(sender: UIBarButtonItem) {
        if let url = NSURL(string: issue!.url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    

}
