//
//  DataTableViewController.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 2/4/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
/// - Attributions: for adding a tab delegate http://stackoverflow.com/questions/30849030/how-to-do-an-action-when-tab-bar-item-is-pressed-swift

import UIKit

class DataTableViewController: UITableViewController {
    
    // MARK: Properties

    
    /// Defaults
    /// - Attributions: https://www.hackingwithswift.com/read/12/2/reading-and-writing-basics-nsuserdefaults
    let defaults = NSUserDefaults.standardUserDefaults()
    
    /// UIButton for Navigation Controller
    var toggleButton: UIButton = UIButton()
    
    /// UIView container that also stores my activity indicator
    var activityContainer: UIView {
        /// - Attributions: worked with Dana to define pattern of liveActivity Container and maintain state for closure. See lazy property
        if let liveActivityContainer = _activityContainer {
            return liveActivityContainer
        } else {
            //create and color a container for indicator
            let newActivityContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            newActivityContainer.backgroundColor = UIColor.grayColor()
            newActivityContainer.layer.cornerRadius = 5
            
            /// - Attributions: Chaunxi gave me idea to correct for navBar height, I added status Bar
            // get height of navBar and Status Bar
            let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
            let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
            
            // center the new view correcting for top margin
            newActivityContainer.center.x = tableView.center.x
            newActivityContainer.center.y = tableView.center.y - navigationBarHeight! - statusBarHeight
            
            // center the activity indicator
            activityIndicator.center.x = newActivityContainer.frame.size.width/2
            activityIndicator.center.y = newActivityContainer.frame.size.height/2
            
            // add subviews
            newActivityContainer.addSubview(activityIndicator)
            
            // makesure it returns the same object
            _activityContainer = newActivityContainer
            return _activityContainer!
        }
    }
    
    var _activityContainer: UIView?
    
    // create activity indicator
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)

    /// The array of dictionaries that will hold all of our issues
    var issues:[[String: AnyObject]]? {
        willSet {
        }
        didSet {
            // Reloads the view after issues is set

            // gets the data right away
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                sleep(1)
                self.activityIndicator.stopAnimating()
                self.activityContainer.removeFromSuperview()
            }
        }
    }
    
    /// updates the api url string - to be overrided in subclasses
    var gitHubQuery: String = ""
    
    /// updates cell Identifier
    var cellIdentifier = ""
    
    /// table Footer Variable
    /// - Attributions: http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview for how to implement footer
    var tableDataFooterDate = ""
    
    // MARK: Lifecycle
    
    /// executes after the initial view has loaded

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add to views to the view object
        tableView.addSubview(activityContainer)
        
        // start animating activity Indicator
        activityIndicator.startAnimating()
        
        // set the defaults
        if let date = defaults.objectForKey("firstLaunch"){
            print("Not First Launch: ✌️, First Launch: \(date) ")
        } else {
            defaults.setObject(NSDate(), forKey: "firstLaunch")
            print("First Launch:🖕")
        }
        
        // enforces initial nightmode settings
        setCorrectColors()
        
        print("View Did Load Called")

    }
    
    override func viewWillAppear(animated: Bool) {

        // Make a request for data from GitHub based on the gitHubQuery
        GitHubNetworkingManager.sharedInstance.issuesRequestion(self.gitHubQuery) { (response) -> Void in
            
            self.tableDataFooterDate = Helper.returnCurrentDate()
            
            // Test that the `response` is not `nil` and unwrap it to the variable
            // response.  IF it is `nil` then return the function so that we do not reload the table unnecessarily.
            guard let response = response else {
                self.makeAlertForNetworkError()
                return
            }
            
            // Set the response data to the view controller's `issues` property
            self.issues = response
        }
        
        // adding target (self) and action to refreshControl object of tableViewController
        self.refreshControl?.addTarget(self, action: "refreshTable:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //
    // MARK: - Table View Refresh
    //
    
    /// Reload the table with newly downloaded data. This should be called when
    /// the table is first shown onscreen and when the user conducts a pull-to-refresh operation.

    /// - Note: You should be telling your table to reload here
    /// - Attributions: Lecture slides and assignment write-up, as well as https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/#example-scenario
    func refreshTable(refreshControl: UIRefreshControl) {
        
        // update the table view's source data
        GitHubNetworkingManager.sharedInstance.issuesRequestion(gitHubQuery) { (response) -> Void in
            
            self.tableDataFooterDate = Helper.returnCurrentDate()
            // Test that the `response` is not `nil` and unwrap it to the variable
            // response.  IF it is `nil` then return the function so that we do not
            // reload the table unnecessarily.
            guard let response = response else {
                self.makeAlertForNetworkError()
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
    /// - Attributions: http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview for how to implement footer also worked with nickpann (github id) to use viewFooterInSection instead of titleForFooterInSection

    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerLabel = UILabel()
        
        // add date
        footerLabel.text = tableDataFooterDate
        
        
        // enforce coloring for footer
        if defaults.boolForKey("nightModeOn") == false {
            //set colors
            footerLabel.backgroundColor = UIColor.grayColor()
            footerLabel.textColor = UIColor.blackColor()
            
        } else {
            defaults.setBool(true, forKey: "nightModeOn")
            //set colors
            footerLabel.backgroundColor = UIColor.blackColor()
            footerLabel.textColor = UIColor.whiteColor()
        }

        //algin footer
        footerLabel.textAlignment = NSTextAlignment.Center
        
        return footerLabel
    }
    
    /// Helper Functions
    
    /// toggles nightMode
    func toggleNightMode() -> Void {
        if defaults.boolForKey("nightModeOn") == true {
            //flip the nightmode bool
            defaults.setBool(false, forKey: "nightModeOn")
            
            //set colors
            self.navigationController?.navigationBar.barTintColor = UIColor.grayColor()
            self.tabBarController?.tabBar.barTintColor = UIColor.grayColor()
            self.tableView.reloadData()
            
        } else {
            //flip the nightmode bool
            defaults.setBool(true, forKey: "nightModeOn")
            
            //set colors
            self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
            self.tabBarController?.tabBar.barTintColor = UIColor.blackColor()
            self.tableView.reloadData()
        }
    }
    
    /// ensures correct colors are enforced
    func setCorrectColors() -> Void {
        // ensure consistent color for night mode
        if defaults.boolForKey("nightModeOn") == false {
            
            //set colors
            self.navigationController?.navigationBar.barTintColor = UIColor.grayColor()
            self.tabBarController?.tabBar.barTintColor = UIColor.grayColor()
            self.activityContainer.backgroundColor = UIColor.grayColor()
            self.tableView.reloadData()
            
        } else {
            defaults.setBool(true, forKey: "nightModeOn")
            
            //set colors
            self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
            self.tabBarController?.tabBar.barTintColor = UIColor.blackColor()
            self.activityContainer.backgroundColor = UIColor.blackColor()
            self.tableView.reloadData()
        }
    }
    
    /// creates an alertview for network errors
    func makeAlertForNetworkError() -> Void {
        let alertController = UIAlertController(title: "Network Error", message: "Get some Internets, Fool 👻👻👻", preferredStyle: .ActionSheet)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            return
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            return
        }
    }
    
    /// MARK: Action
    @IBAction func nightMode(sender: UIBarButtonItem) {
        // toggle the night mode and colors
        toggleNightMode()
    }
    
    /// MARK: TabBarDelegate Method
    
//    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        setCorrectColors()
//        print("colors set from tabBar")
//    }
    
    

}