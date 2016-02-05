//
//  DataTableViewController.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 2/4/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {
    
    // MARK: Properties
    
    /// The array of dictionaries that will hold all of our issues
    var issues:[[String: AnyObject]]?
    
    /// updates the api url string - to be overrided in subclasses
    var gitHubQuery: String = ""
    
    /// updates cell Identifier
    var cellIdentifier = ""
    
    /// table Footer Variable
    /// - Attributions: http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview for how to implement footer
    var tableDataFooterDate = "Footer - Section 0"
    
    // MARK: Lifecycle
    
    /// executes after the initial view has loaded

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///tableFooter implementation
//        let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 50))
//        tableViewFooter.backgroundColor = UIColor.greenColor()
//        tableView.tableFooterView  = tableViewFooter
    }
    
    override func viewWillAppear(animated: Bool) {

        // Make a request for data from GitHub based on the gitHubQuery
        Helper.issuesRequestion(self.gitHubQuery) { (response) -> Void in
            
            self.tableDataFooterDate = Helper.returnCurrentDate()
            
            // Test that the `response` is not `nil` and unwrap it to the variable
            // response.  IF it is `nil` then return the function so that we do not reload the table unnecessarily.
            guard let response = response else {
                return
            }
            
            // Set the response data to the view controller's `issues` property
            self.issues = response
            
            // Call our method that will prompt the table to reload itself with the updated data
            //            self.refreshTable()
            
            // gets the data right away
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        
        // adding target (self) and action to refreshControl object of tableViewController
        self.refreshControl?.addTarget(self, action: "refreshTable:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl!)
    }
    
    //
    // MARK: - Table View Refresh
    //
    
    /// Reload the table with newly downloaded data. This should be called when
    /// the table is first shown onscreen and when the user conducts a pull-to-refresh operation.

    /// - Note: You should be telling you table to reload here
    /// - Attributions: Lecture slides and assignment write-up, as well as https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/#example-scenario
    func refreshTable(refreshControl: UIRefreshControl) {
        
        print(gitHubQuery)
        // update the table view's source data
        Helper.issuesRequestion(gitHubQuery) { (response) -> Void in
            
            self.tableDataFooterDate = Helper.returnCurrentDate()
            // Test that the `response` is not `nil` and unwrap it to the variable
            // response.  IF it is `nil` then return the function so that we do not
            // reload the table unnecessarily.
            guard let response = response else {
                return
            }
            
            // Set the response data to the view controller's `issues` property
            self.issues = response
            
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
    
        //refresh the view
        self.tableView.reloadData()
        refreshControl.endRefreshing()
        
    }
    
    // MARK: - Table view data source methods

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // - Attributions: referenced gitHub class discussion
        
        if issues == nil {
            return 0
        } else {
            return issues!.count
        }
    }
    
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
    
    // footer addition
    /// - Attributions: http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview for how to implement footer

    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return tableDataFooterDate
    }

}