//
//  CAShapeLayer+CustomBezierPath.swift
//  BezierPathAnimationSample
//
//  Created by Yuhei Miyazato on 8/11/15.
//  Copyright (c) 2015 mitolab. All rights reserved.
//

import Foundation
import UIKit

extension CAShapeLayer {
    
    class func awkwardCircle(rect:CGRect, delegate :AnyObject?, color:UIColor, pathSeries:[Int]) -> CAShapeLayer {
        
        let originalSize = CGSizeMake(2048, 2048)   // Artboard size in pixels on Adobe Illustrator
        let wRatio = rect.size.width / originalSize.width
        let hRatio = rect.size.height / originalSize.height
        let scale = CGAffineTransformMakeScale(wRatio, hRatio)
        
        let anim = CAKeyframeAnimation(keyPath: "path")
        
        var animPaths = [CGPathRef]()
        var timingFuncs = [CAMediaTimingFunction]()
        for i in 0..<pathSeries.count {
            animPaths.append(CAShapeLayer.circlePath(pathSeries[i], scale: scale))
            timingFuncs.append(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        }
        animPaths.append(CAShapeLayer.circlePath(pathSeries[0], scale: scale))  // back to starting shape
        
        anim.values = animPaths
        anim.timingFunctions = timingFuncs
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.duration = 10
        if let del: AnyObject = delegate {
            anim.delegate = del
        }
        
        let targetLayer = CAShapeLayer()
        targetLayer.frame = rect
        targetLayer.lineWidth = 0
        targetLayer.strokeColor = nil
        targetLayer.fillColor = color.CGColor
        targetLayer.path = animPaths[0]
        targetLayer.fillRule = kCAFillRuleEvenOdd
        targetLayer.addAnimation(anim, forKey: __FUNCTION__)
        
        return targetLayer
    }
    
    class func circlePath(pathNum: Int, scale:CGAffineTransform) -> CGPathRef {
        
        var path = UIBezierPath()

        switch pathNum {
        case 0:
            path.moveToPoint(CGPointMake(1572.054, 986.22))
            path.addCurveToPoint(CGPointMake(1038.561, 1675.964), controlPoint1:CGPointMake(1572.054, 1318.507), controlPoint2:CGPointMake(1370.847, 1675.964))
            path.addCurveToPoint(CGPointMake(379.057, 1050.19), controlPoint1:CGPointMake(706.274, 1675.964), controlPoint2:CGPointMake(379.057, 1382.477))
            path.addCurveToPoint(CGPointMake(1003.163, 458.346), controlPoint1:CGPointMake(379.057, 717.903), controlPoint2:CGPointMake(670.877, 458.346))
            path.addCurveToPoint(CGPointMake(1572.054, 986.22), controlPoint1:CGPointMake(1335.45, 458.346), controlPoint2:CGPointMake(1572.054, 653.934))
        case 1:
            path.moveToPoint(CGPointMake(1625.658, 981.405))
            path.addCurveToPoint(CGPointMake(1032.61, 1623.284), controlPoint1:CGPointMake(1625.658, 1293.051), controlPoint2:CGPointMake(1344.256, 1623.284))
            path.addCurveToPoint(CGPointMake(422.342, 1049.409), controlPoint1:CGPointMake(720.963, 1623.284), controlPoint2:CGPointMake(422.342, 1361.056))
            path.addCurveToPoint(CGPointMake(1047.786, 424.716), controlPoint1:CGPointMake(422.342, 737.763), controlPoint2:CGPointMake(736.139, 424.716))
            path.addCurveToPoint(CGPointMake(1625.658, 981.405), controlPoint1:CGPointMake(1359.432, 424.716), controlPoint2:CGPointMake(1625.658, 669.758))
        case 2:
            path.moveToPoint(CGPointMake(1683.656, 991.026))
            path.addCurveToPoint(CGPointMake(998.941, 1596.322), controlPoint1:CGPointMake(1683.656, 1302.672), controlPoint2:CGPointMake(1310.587, 1596.322))
            path.addCurveToPoint(CGPointMake(366.344, 978.988), controlPoint1:CGPointMake(687.294, 1596.322), controlPoint2:CGPointMake(366.344, 1290.634))
            path.addCurveToPoint(CGPointMake(959.195, 451.678), controlPoint1:CGPointMake(366.344, 667.341), controlPoint2:CGPointMake(647.548, 451.678))
            path.addCurveToPoint(CGPointMake(1683.656, 991.026), controlPoint1:CGPointMake(1270.841, 451.678), controlPoint2:CGPointMake(1683.656, 679.379))
        case 3:
            path.moveToPoint(CGPointMake(1620.065, 890.687))
            path.addCurveToPoint(CGPointMake(983.072, 1585.738), controlPoint1:CGPointMake(1620.065, 1202.333), controlPoint2:CGPointMake(1294.718, 1585.738))
            path.addCurveToPoint(CGPointMake(427.935, 1023.243), controlPoint1:CGPointMake(671.425, 1585.738), controlPoint2:CGPointMake(427.935, 1334.889))
            path.addCurveToPoint(CGPointMake(919.31, 462.262), controlPoint1:CGPointMake(427.935, 711.596), controlPoint2:CGPointMake(607.664, 462.262))
            path.addCurveToPoint(CGPointMake(1620.065, 890.687), controlPoint1:CGPointMake(1230.957, 462.262), controlPoint2:CGPointMake(1620.065, 579.041))
        case 4:
            path.moveToPoint(CGPointMake(1599.003, 992.915))
            path.addCurveToPoint(CGPointMake(1157.498, 1608.709), controlPoint1:CGPointMake(1599.003, 1304.561), controlPoint2:CGPointMake(1469.144, 1608.709))
            path.addCurveToPoint(CGPointMake(448.997, 1013.941), controlPoint1:CGPointMake(845.852, 1608.709), controlPoint2:CGPointMake(448.997, 1325.588))
            path.addCurveToPoint(CGPointMake(1009.974, 439.291), controlPoint1:CGPointMake(448.997, 702.295), controlPoint2:CGPointMake(698.328, 439.291))
            path.addCurveToPoint(CGPointMake(1599.003, 992.915), controlPoint1:CGPointMake(1321.621, 439.291), controlPoint2:CGPointMake(1599.003, 681.268))
        case 5:
            path.moveToPoint(CGPointMake(1632.158, 1060.471))
            path.addCurveToPoint(CGPointMake(1275.731, 1477.769), controlPoint1:CGPointMake(1632.158, 1372.117), controlPoint2:CGPointMake(1587.377, 1477.769))
            path.addCurveToPoint(CGPointMake(562.089, 1054.325), controlPoint1:CGPointMake(964.084, 1477.769), controlPoint2:CGPointMake(562.089, 1365.971))
            path.addCurveToPoint(CGPointMake(1105.864, 565.902), controlPoint1:CGPointMake(562.089, 742.678), controlPoint2:CGPointMake(794.218, 565.902))
            path.addCurveToPoint(CGPointMake(1632.158, 1060.471), controlPoint1:CGPointMake(1417.511, 565.902), controlPoint2:CGPointMake(1632.158, 748.824))
        case 6:
            path.moveToPoint(CGPointMake(1533.234, 910.93))
            path.addCurveToPoint(CGPointMake(1199.892, 1598.747), controlPoint1:CGPointMake(1533.234, 1222.576), controlPoint2:CGPointMake(1511.538, 1598.747))
            path.addCurveToPoint(CGPointMake(324.27, 896.032), controlPoint1:CGPointMake(888.245, 1598.747), controlPoint2:CGPointMake(324.27, 1207.679))
            path.addCurveToPoint(CGPointMake(979.331, 334.735), controlPoint1:CGPointMake(324.27, 584.386), controlPoint2:CGPointMake(667.685, 334.735))
            path.addCurveToPoint(CGPointMake(1533.234, 910.93), controlPoint1:CGPointMake(1290.978, 334.735), controlPoint2:CGPointMake(1533.234, 599.283))
        default: break
        }
        
        //path.closePath()
        path.applyTransform(scale)
        
        return path.CGPath
    }
}
