//
//  ViewController.swift
//  BezierPathAnimationSample
//
//  Created by Yuhei Miyazato on 8/7/15.
//  Copyright (c) 2015 mitolab. All rights reserved.
//

import UIKit

// taken from http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
// thanks!
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 0.5)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class ViewController: UIViewController {

    let pathSeries = [
        [0,1,2,3,4,5,6],
        [3,5,4,6,2,0,1],
        [5,4,3,2,6,1,0],
        [4,6,1,5,0,3,2],
        [1,3,2,6,4,0,5],
        [2,1,5,0,3,6,4],
    ]
    
    // Taken from http://ameblo.jp/omatsu777/entry-11867659014.html Thanks!
    let colors = [
        UIColor(red: 105, green: 176, blue: 18),    // green
        UIColor(red: 248, green: 187, blue: 19),    // yellow
        UIColor(red: 230, green: 131, blue: 2),     // orange
        UIColor(red: 198, green: 45, blue: 50),     // red
        UIColor(red: 134, green: 40, blue: 114),    // purple
        UIColor(red: 19, green: 144, blue: 208),    // blue
    ]
    
    var circles = [CAShapeLayer]()
    var isUpdating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        isUpdating = true
        
        for circle in self.circles {
            circle.removeFromSuperlayer()
        }
        self.circles.removeAll(keepCapacity: false)
        
        let rect = self.view.frame
        let circleRect = CGRectMake(0, CGRectGetMidY(rect) - CGRectGetWidth(rect)*0.5, CGRectGetWidth(rect), CGRectGetWidth(rect))
        
        
        for i in 0..<pathSeries.count {
            let aCircle = CAShapeLayer.awkwardCircle(circleRect, delegate: self, color: colors[i], pathSeries: pathSeries[i])
            self.circles.append(aCircle)
            
            let randIdx = arc4random_uniform(UInt32(pathSeries.count))
            self.view.layer.insertSublayer(aCircle, atIndex: randIdx)
        }
        
        isUpdating = false
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if isUpdating { return }
        self.view.setNeedsLayout()
    }
}

