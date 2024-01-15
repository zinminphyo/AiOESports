//
//  StarCountFilterCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit

class StarCountFilterCell: UICollectionViewCell {
    
    @IBOutlet private(set) var filterTitleLabel: UILabel!
    @IBOutlet private(set) var containerView: UIView!
    
    static var reuseIdenfier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 17
        containerView.layer.cornerCurve = .continuous
        
    }
    
    @discardableResult
    func render(name: String) -> Self {
        filterTitleLabel.text = name
        return self
    }
    
    @discardableResult
    func render(isSelected: Bool) -> Self {
        containerView.backgroundColor = isSelected ? Colors.Button.blueColor : Colors.Theme.inputColor
        return self
    }

}
