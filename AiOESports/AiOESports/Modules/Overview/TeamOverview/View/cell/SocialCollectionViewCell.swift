//
//  SocialCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit
import Kingfisher

class SocialCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var socialTypeImageView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    private func configureHierarchy() {
        configureContainerView()
        configureImageContainerView()
        configureImageView()
    }
    
    private func configureContainerView() {
        self.backgroundColor = UIColor.clear
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
//        containerView.backgroundColor = Colors.Text.primaryText
    }
    
    private func configureImageContainerView() {
        imageContainerView.backgroundColor = UIColor.clear
        imageContainerView.layer.cornerRadius = 8
    }
    
    private func configureImageView() {
//        socialTypeImageView.contentMode = .scaleAspectFit
//        socialTypeImageView.image = Images.SocialLogo.facebook
    }
    
    func renderUI(social: SocialModel) {
        socialTypeImageView.image = Images.SocialLogo.getImage(socialName: social.platform)
    }
    
    func renderUI(signature: SignatureModel) {
        socialTypeImageView.kf.setImage(with: URL(string: signature.signatureImageFullPath))
    }
    
}

