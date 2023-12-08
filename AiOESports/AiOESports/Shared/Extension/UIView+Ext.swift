//
//  UIView+Ext.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/12/2023.
//

import Foundation
import UIKit


extension UIView {
    
     func appliedGrandientColor() {
    
        let gradient = CAGradientLayer()
        gradient.frame = bounds
         gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
         gradient.colors = [Colors.Gradient.startColor.cgColor, Colors.Gradient.endColor.cgColor]
         self.layer.masksToBounds = true
         self.layer.addSublayer(gradient)
        
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { backgroundColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
}
