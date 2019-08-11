//
//  UIViewExtensions.swift
//  VPN-iOS
//
//  Created by Sergii Kryvoblotskyi on 8/11/19.
//  Copyright © 2019 MacPaw. All rights reserved.
//

import UIKit

extension UIView {
    
    func embed(_ subview: UIView) {
        addSubview(subview)
        let leadingConstraint = NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
