//
//  CircleViewController.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/29/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

import Foundation

class CircleViewController: UIViewController {
    
    // MARK: Properties
    
    //declared as optionals because compiler is complaining that I don't have an initializer
    var numberOfClosedIssues: Int?
    var numberOfOpenIssues: Int?
    
    var issues:[[String: AnyObject]]?
    
    @IBOutlet weak var openIssueLabel: UILabel!
    @IBOutlet weak var closedIssueLabel: UILabel!
    
    // test circle
//    var testCircle: CircleView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a request for all open data from GitHub
        Helper.issuesRequestion("https://api.github.com/repos/uchicago-mobi/2016-Winter-Forum/issues?state=all") { (response) -> Void in
            
            // Test that the `response` is not `nil` and unwrap it to the variable
            // response.  IF it is `nil` then return the function so that we do not
            // reload the table unnecessarily.
            guard let response = response else {
                return
            }
            
            // Set the response data to the view controller's `issues` property
            self.issues = response
            
            // count the number of open issues
            self.numberOfClosedIssues = 0
            self.numberOfOpenIssues = 0
            
            for issue in self.issues! {
                if issue["state"] as? String == "open" {
                    self.numberOfOpenIssues! += 1
                } else {
                    self.numberOfClosedIssues! += 1
                }
            }
            
            /*
            // commented circles -- originally had configured these circles to be proportional to the number of open and closed issues -- but this wasn't part of the requirement so I removed it
            
            // Determine width of open Issue Circle
            let ratioOfClosedIssueCircle = Double(self.numberOfClosedIssues!)/Double((self.numberOfClosedIssues! + self.numberOfOpenIssues!))
            
            let closedCircleDiameter = Int(round(ratioOfClosedIssueCircle * 300))
            
            // Determine width of closed Issue Circle
            let ratioOfOpenIssueCircle = Double(self.numberOfOpenIssues!)/Double((self.numberOfClosedIssues! + self.numberOfOpenIssues!))
            
            let openCircleDiameter = Int(round(ratioOfOpenIssueCircle * 300))
            */
            
            // use dispatch_async to wait for thread and draw my screen
            dispatch_async(dispatch_get_main_queue()) {
                
                /*
                // commented circles -- originally had configured these circles to be proportional to the number of open and closed issues -- but this wasn't part of the requirement so I removed it
                
                // draw circles
                self.addCircleView(closedCircleDiameter, color: UIColor.redColor())
                self.addCircleView(openCircleDiameter, color: UIColor.greenColor())
                */
                
                self.addCircleView(250, color: UIColor.orangeColor())
                
                self.addCircleView(300, color: UIColor.grayColor())
                
                // set Open Issue and Closed Issue labels
                self.openIssueLabel.text = "Open Issues: \(self.numberOfOpenIssues!)"
                self.openIssueLabel.textColor = UIColor.orangeColor()
                
                self.closedIssueLabel.text = "Closed Issues: \(self.numberOfClosedIssues!)"
                self.closedIssueLabel.textColor = UIColor.grayColor()
            }
        }
    }
    
    /// MARK: Circle Helpers
    
    /// draws a circle and takes a point value width as well as color
    /// - Attributions: for centering circle http://stackoverflow.com/questions/32219161/set-the-center-of-a-uibutton-programmatically-swift
    func addCircleView(circleIntWidth: Int, color: UIColor) {
        
        // defines width and height
        let circleWidth = CGFloat(circleIntWidth)
        let circleHeight = circleWidth
        
        // defines the x and y center points
        let xcoord = self.view.bounds.width/2
        let ycoord = self.view.bounds.height/2
        
        // attempt to center the circle
        
        
        // Create a new CircleView
        let circleView = CircleView(frame: CGRectMake(xcoord, ycoord, circleWidth, circleHeight), color: color)
        
        //center the circle
        circleView.center = self.view.center
        
        //add to subView
        view.addSubview(circleView)
    }
}
