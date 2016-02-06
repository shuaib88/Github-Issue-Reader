//
//  TabBarController.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 2/5/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in self.tabBar.items! as [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithRenderingMode(.AlwaysOriginal)
                
            }
        }
    }
    
    

}
