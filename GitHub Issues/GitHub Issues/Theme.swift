//
//  Theme.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 2/6/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
/// Attributions: - http://www.raywenderlich.com/108766/uiappearance-tutorial


import Foundation

import UIKit

let SelectedThemeKey = "SelectedTheme"

enum Theme: Int {
    
    case Default, Dark
    
    var mainColor: UIColor {
        switch self {
            
        case .Default:
            return UIColor.grayColor()
        case .Dark:
            return UIColor.blackColor()
        
        }
    
    }
}

struct ThemeManager {
    
    static func currentTheme() -> Theme {
        if let storedTheme = NSUserDefaults.standardUserDefaults().valueForKey(SelectedThemeKey)?.integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .Default
        }
    }
    
}