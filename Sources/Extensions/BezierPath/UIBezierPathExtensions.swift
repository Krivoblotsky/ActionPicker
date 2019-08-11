//
//  UIBezierPathExtensions.swift
//  VPN-iOS
//
//  Created by Sergii Kryvoblotskyi on 8/11/19.
//  Copyright © 2019 MacPaw. All rights reserved.
//

import UIKit

public extension UIBezierPath {
    
    //    controlPoint42         point 1
    //               ____*____....*....
    //               |      ..............
    //controlPoint41 *    ...            ...
    //               |  ...                ...
    //               |...                    ...
    //               ...                      ...
    //       point4  *..                      ..* point 2
    //               ...                      ...
    //                ...                    ...
    //                 ...                  ...
    //                  ...               ...
    //                    .................
    //                       .....*.....
    //                          point 3
    class func squirclePath(rect: CGRect, controlPointRatio: CGFloat) -> UIBezierPath {
        let width = rect.size.width
        let height = rect.size.height
        let halfWidth = width / 2.0
        let halfHeight = height / 2.0
        
        let controlPointRatio = controlPointRatio
        let inversedControlPointRatio = 1 - controlPointRatio
        
        let point1 = CGPoint(x: width / 2.0, y: height)
        let point2 = CGPoint(x: width, y: height / 2.0)
        let point3 = CGPoint(x: width / 2.0, y: 0)
        let point4 = CGPoint(x: 0, y: height / 2.0)
        
        let controlPoint11 = CGPoint(x: halfWidth + (halfWidth * controlPointRatio), y: height)
        let controlPoint12 = CGPoint(x: width, y: halfHeight + (halfHeight * controlPointRatio))
        
        let controlPoint21 = CGPoint(x: width, y: halfWidth * inversedControlPointRatio)
        let controlPoint22 = CGPoint(x: halfWidth + (halfWidth * controlPointRatio), y: 0)
        
        let controlPoint31 = CGPoint(x: halfWidth * inversedControlPointRatio, y: 0)
        let controlPoint32 = CGPoint(x: 0, y: halfHeight * inversedControlPointRatio)
        
        let controlPoint41 = CGPoint(x: 0, y: halfHeight + (halfHeight * controlPointRatio))
        let controlPoint42 = CGPoint(x: (halfWidth * inversedControlPointRatio), y: height)
        
        let squirclePath = UIBezierPath()
        squirclePath.move(to: point1)
        squirclePath.addCurve(to: point2, controlPoint1: controlPoint11, controlPoint2: controlPoint12)
        squirclePath.addCurve(to: point3, controlPoint1: controlPoint21, controlPoint2: controlPoint22)
        squirclePath.addCurve(to: point4, controlPoint1: controlPoint31, controlPoint2: controlPoint32)
        squirclePath.addCurve(to: point1, controlPoint1: controlPoint41, controlPoint2: controlPoint42)
        
        let transform = CGAffineTransform(translationX: rect.origin.x, y: rect.origin.y)
        squirclePath.apply(transform)
        
        return squirclePath
    }
    
    class func cmm_squirclePath(rect: CGRect) -> UIBezierPath {
        return squirclePath(rect: rect, controlPointRatio: 0.6)
    }
}
