//
//  PushButtonView.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/31/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

class PushButtonView: UIButton {

    
    /// - Attributions: http://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1 this code will draw a button
    override func drawRect(rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalInRect: rect)
        UIColor.greenColor().setFill()
        path.fill()
    }
    

}
