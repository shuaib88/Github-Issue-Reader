////
////  CounterView.swift
////  GitHub Issues
////
////  Created by Shuaib Ahmed on 1/31/16.
////  Copyright © 2016 Shuaib Labs. All rights reserved.
////
//
//import UIKit
//
//let NoOfGlasses = 8
//let π:CGFloat = CGFloat(M_PI)
//
//@IBDesignable class CounterView: UIView {
//    
//    @IBInspectable var counter: Int = 5
//    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
//    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
//
//    // Only override drawRect: if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//        // defines center point
//        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
//        
//        
//        // calculates radius based on bounds
//        let radius: CGFloat = max(bounds.width, bounds.height)
//        
//        // defines thickness
//        let arcWidth: CGFloat = 20
//        
//        // defines start and end angles
//        let startAngle: CGFloat = π / 4
//        let endAngle: CGFloat = π / 5
//        
//        // define the path
//        var path = UIBezierPath(arcCenter: center,
//            radius: radius/2 - arcWidth/2,
//            startAngle: startAngle,
//            endAngle: endAngle,
//            clockwise: true)
//        
//        // define width of path,
//        path.lineWidth = arcWidth
//        counterColor.setStroke()
//        path.stroke()
//        
//        
//    }
//
//}
