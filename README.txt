GitHub Issues

This app presents information from gitbhub issues from uchicago.mobi/winter-2016
It presents Open Issues, All Issues, and Status (displays the number of open and clsed issues)

In this assignment I've built upon last week and included functionality. Note I could not figure out how to have my CircleViewController enforce all the coloring for my night mode. I think I need to use the TabController but I wasn't able to use it's delegation properties correctly. 

Here are some attributions to resources I used.

Collaborators - I worked with Eric Warhime on figuring out how to pull issue data. And Nick Pann and I worked together to figure out drawing circles. We didn't use the same code, but ended up sharing sources. I helped him with the code for getting the counts for the number of open and closed issues. Additionally I helped him and Mike with formatting their date strings. Nick Pann helped me figure out how to correctly use async_dispatch 

CircleView.swift:/// - Attributions: https://stackoverflow.com/questions/26578023/animate-drawing-of-a-circle

CircleViewController.swift:    /// - Attributions: for centering circle http://stackoverflow.com/questions/32219161/set-the-center-of-a-uibutton-programmatically-swift

IssueTableViewController.swift:    /// - Attributions: Lecture slides and assignment write-up, as well as https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/#example-scenario

PushButtonView.swift:    /// - Attributions: http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1 this code will draw a button

AppDelegate.swift:        /// - Attributions: https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift
AppDelegate.swift:        /// - Attributions: http://stackoverflow.com/questions/26704896/swift-uitabbaritem-colors
CircleView.swift:/// - Attributions: https://stackoverflow.com/questions/26578023/animate-drawing-of-a-circle
CircleViewController.swift:    /// - Attributions: https://www.hackingwithswift.com/read/12/2/reading-and-writing-basics-nsuserdefaults
CircleViewController.swift:    /// - Attributions: for centering circle http://stackoverflow.com/questions/32219161/set-the-center-of-a-uibutton-programmatically-swift
DataTableViewController.swift:/// - Attributions: for adding a tab delegate http://stackoverflow.com/questions/30849030/how-to-do-an-action-when-tab-bar-item-is-pressed-swift
DataTableViewController.swift:    /// - Attributions: https://www.hackingwithswift.com/read/12/2/reading-and-writing-basics-nsuserdefaults
DataTableViewController.swift:        /// - Attributions: worked with Dana to define pattern of liveActivity Container and maintain state for closure. See lazy property
DataTableViewController.swift:            /// - Attributions: Chaunxi gave me idea to correct for navBar height, I added status Bar
DataTableViewController.swift:    /// - Attributions: http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview for how to implement footer
DataTableViewController.swift:    /// - Attributions: Lecture slides and assignment write-up, as well as https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/#example-scenario
DataTableViewController.swift:    /// - Attributions: http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview for how to implement footer also worked with nickpann (github id) to use viewFooterInSection instead of titleForFooterInSection
IssueDetailViewController.swift:    /// - Attributions: http://code.tutsplus.com/tutorials/ios-9-getting-started-with-sfsafariviewcontroller--cms-24260
PushButtonView.swift:    /// - Attributions: http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1 this code will draw a button
 
