//
//  UIButton+Ext.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/12/2023.
//

import Foundation
import UIKit

extension UIButton {
    
    func appliedNotVotedBackground() {
        let startColor: CGColor = Colors.Gradient.startColor.cgColor
        let endColor: CGColor = Colors.Gradient.endColor.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "notvoted"
        gradientLayer.frame = bounds
        self.layer.sublayers?.removeAll(where: { $0.name == "voted"})
        gradientLayer.colors = [startColor, endColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func appliedVotedBackground() {
        let layer = CAGradientLayer()
        layer.name = "voted"
        self.layer.sublayers?.removeAll(where: { $0.name == "notvoted" })
        layer.backgroundColor = Colors.Theme.mainColor?.cgColor
        layer.frame = bounds
        self.layer.insertSublayer(layer, at: 0)
    }
    
}
