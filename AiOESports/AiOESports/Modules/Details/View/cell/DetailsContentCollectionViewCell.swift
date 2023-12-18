//
//  DetailsContentCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit

class DetailsContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        containerView.backgroundColor = Colors.Theme.inputColor
        
//        titleLabel.font = Fonts.subtitleFont
        titleLabel.textColor = Colors.Text.primaryText
        
        containerView.backgroundColor = Colors.Theme.inputColor
        containerView.layer.cornerRadius = 2
    }
    
    @discardableResult
    func set(title: String) -> Self {
        titleLabel.text = title
        return self
    }

    @discardableResult
    func set(isSelected: Bool) -> Self {
        titleLabel.textColor = isSelected ? Colors.Text.primaryText : Colors.Text.secondaryText
        selectionContainerView.backgroundColor = isSelected ? Colors.Button.primaryColor : Colors.Theme.SecondaryBackground
        return self
    }
}
