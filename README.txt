GitHub Issues

This app presents information from gitbhub issues from uchicago.mobi/winter-2016
It presents Open Issues, All Issues, and Status (displays the number of open and clsed issues)

A note about CircleViewController: I originally implemented circles that were proportional tothe amount of open and closed issues. However on closer reading of the assignment this was not specified anywhere. I left the code included, but commented it out. 

Here are some attributions to resources I used.

Collaborators - I worked with Eric Warhime on figuring out how to pull issue data. And Nick Pann and I worked together to figure out drawing circles. We didn't use the same code, but ended up sharing sources. I helped him with the code for getting the counts for the number of open and closed issues. Additionally I helped him and Mike with formatting their date strings. Nick Pann helped me figure out how to correctly use async_dispatch 

CircleView.swift:/// - Attributions: https://stackoverflow.com/questions/26578023/animate-drawing-of-a-circle

CircleViewController.swift:    /// - Attributions: for centering circle http://stackoverflow.com/questions/32219161/set-the-center-of-a-uibutton-programmatically-swift

IssueTableViewController.swift:    /// - Attributions: Lecture slides and assignment write-up, as well as https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/#example-scenario

PushButtonView.swift:    /// - Attributions: http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1 this code will draw a button
 
