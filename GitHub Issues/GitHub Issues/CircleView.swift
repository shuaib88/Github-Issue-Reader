//
//  CircleView.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/31/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit


/// - Attributions: https://stackoverflow.com/questions/26578023/animate-drawing-of-a-circle
class CircleView: UIView {
    
    var color = UIColor.redColor()
    
    
    // initializer passes in a color
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        self.color = color
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawRect(rect: CGRect) {
        // Get the Graphics Context
        let context = UIGraphicsGetCurrentContext();
        
        // Set the circle outerline-width
        CGContextSetLineWidth(context, 5.0);
        
        // Set the circle outerline-colour to the UIView's passed in color
        color.set()
        
        // Create Circle
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 10)/2, 0.0, CGFloat(M_PI * 2.0), 1)
        
        // Draw
        CGContextStrokePath(context);
    }
}
