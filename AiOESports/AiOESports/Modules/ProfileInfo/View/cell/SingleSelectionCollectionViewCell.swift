//
//  SingleSelectionCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/05/2023.
//

import UIKit

class SingleSelectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectionImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureBackgroundView()
        configureImageView()
        configureTitleLabel()
    }
    
    private func configureBackgroundView() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureImageView() {
        selectionImageView.contentMode = .scaleAspectFit
    }
    
    private func configureTitleLabel() {
        titleLabel.font = Fonts.ForCell.titleFont
        titleLabel.textColor = Colors.Text.primaryText
    }

}
