//
//  AppDelegate.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/29/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        /// - Attributions: https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift
        // accesses the appearance protcol for Nav Bar and Tab Bar
        let navigationBarAppearace = UINavigationBar.appearance()
        let tabBarAppearance = UITabBar.appearance()
        let tabBarItem = UITabBarItem.appearance()
        
        // setting the bar colors
        navigationBarAppearace.tintColor = UIColor.orangeColor()
        navigationBarAppearace.barTintColor = UIColor.grayColor()
        
        // setting the tab bar colors
        tabBarAppearance.tintColor = UIColor.whiteColor()
        tabBarAppearance.barTintColor = UIColor.grayColor()
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        /// - Attributions: http://stackoverflow.com/questions/26704896/swift-uitabbaritem-colors
        //selected item text color
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Selected)

        //unselected icon text color
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Normal)
        
        //unselected icon color -- see TabController class
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

