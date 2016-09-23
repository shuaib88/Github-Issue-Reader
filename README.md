## GitHub Issues

This app presents information from gitbhub issues from uchicago.mobi/winter-2016
It presents open issues, all issues, and basic data on number of issues opened/clAosed. There is even a night mode button which allows the user to change the UI Colors to a midnight/black theme.

The app is constructed with several table views which inherit from DataTableViewController. It has a TabBarController which allows easy navigation. THe app also has CircleViewControllers which draw the basic data chart. 

Note for future revision: I could not figure out how to have my CircleViewController enforce all the coloring for my night mode. I think I need to use the TabController but I wasn't able to use it's delegation properties correctly. 

## Attributions

Drawing a circle -  https://stackoverflow.com/questions/26578023/animate-drawing-of-a-circle < br/>
For centering circle -  http://stackoverflow.com/questions/32219161/set-the-center-of-a-uibutton-programmatically-swift < br/>
Pull to refresh - https://www.andrewcbancroft.com/2015/03/17/basics-of-pull-to-refresh-for-swift-developers/#example-scenario < br/>
For drawing a button - http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1 < br/>
Navigation bar customization - https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift  < br/>
UIbarItem colors - http://stackoverflow.com/questions/26704896/swift-uitabbaritem-colors < br/>
Using nsuserdefaults to store basic user data accross restarts - https://www.hackingwithswift.com/read/12/2/reading-and-writing-basics-nsuserdefaults < br/>
For adding a tab delegate - http://stackoverflow.com/questions/30849030/how-to-do-an-action-when-tab-bar-item-is-pressed-swift < br/>
Thanks to @danakatz Github to define pattern of liveActivity Container and maintain state for closure. See lazy property < br/>
Implementing footer - http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/headers-and-footers-in-ios-tableview < br/>
Safari View Controller - http://code.tutsplus.com/tutorials/ios-9-getting-started-with-sfsafariviewcontroller--cms-24260  < br/>
 
