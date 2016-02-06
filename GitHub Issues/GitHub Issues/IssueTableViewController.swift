//
//  IssueTableViewController.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/29/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

class IssueTableViewController: DataTableViewController {
    
    // MARK: Lifecycle
    
    /// executes after the initial view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        gitHubQuery =
            "https://api.github.com/repos/uchicago-mobi/2016-Winter-Forum/issues?state=" + "open"
    }
 
// MARK: - Table view data source methods

    
    /// provides a cell to display (the content) for a given row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "IssueTableViewCell"
        
        // dequeues reusable cell with the IssueTableViewCell we defined in the storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! IssueTableViewCell
        
        // Fetches appropriate issue for the data source layout
        let issue = issues![indexPath.row]
        
        // populates the cell with the right data
        cell.issueNameLabel.text = issue["title"] as? String
        cell.posterIDLabel.text = issue["user"]!["login"] as? String
        let dateString = issue["updated_at"] as? String
        cell.dateLabel.text = Helper.dateFormatter(dateString!)
        
        return cell
    }
    

    // MARK: - Navigation

    /// prepares the next controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let issueDetailViewController = segue.destinationViewController as! IssueDetailViewController
        
        // get the cell that generated the segue
        if let selectedIssueCell = sender as? IssueTableViewCell {
            let indexPath = tableView.indexPathForCell(selectedIssueCell)!
            let selectedIssue = issues![indexPath.row]

            //create an issue object with all the data captured
            let issueNameString = selectedIssue["title"] as? String
            let posterIDString = selectedIssue["user"]!["login"] as? String
            let dateString = Helper.dateFormatter((selectedIssue["updated_at"] as? String)!)
            let statusString = selectedIssue["state"] as? String
            let bodyString = selectedIssue["body"] as? String
            let issueUrlString = selectedIssue["html_url"] as? String
            
            let issueToBePassed = Issue(issueName: issueNameString!, posterID: posterIDString!, date: dateString, status: statusString!, body: bodyString!, url:issueUrlString!)
            
            issueDetailViewController.issue = issueToBePassed
        }
    }
}
