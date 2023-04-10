//
//  SponsorCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit
import Kingfisher

class SponsorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var sponsorImageView: UIImageView!
    @IBOutlet weak var sponsorTypeLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        self.backgroundColor = UIColor.clear
        imageContainerView.layer.cornerRadius = 8
        imageContainerView.clipsToBounds = true
        imageContainerView.layer.borderColor = Colors.Text.secondaryText?.cgColor
        imageContainerView.layer.borderWidth = 0.5
        
        
        sponsorImageView.contentMode = .scaleAspectFit
        
        sponsorTypeLabel.textColor = Colors.Text.primaryText
        sponsorTypeLabel.font = Fonts.ForCell.titleFont
    }
    
    func updateUI(sponsorModel: SponsorModel) {
        sponsorImageView.kf.setImage(with: URL(string: sponsorModel.sponsorLogoFullPath))
        sponsorTypeLabel.text = "Partnership"
    }

}
