//
//  RoundedRectView.swift
//  VPN-iOS
//
//  Created by Sergii Kryvoblotskyi on 8/9/19.
//  Copyright © 2019 MacPaw. All rights reserved.
//

import UIKit

@IBDesignable
final class ActionSheetDecorationView: UIView {

    private let maskLayer: CAShapeLayer = CAShapeLayer()
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet { self.layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable var masksToBounds: Bool = false {
        didSet { self.layer.masksToBounds = masksToBounds }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet { self.layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet { maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        maskLayer.frame = bounds
        maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.mask = maskLayer
    }
}
