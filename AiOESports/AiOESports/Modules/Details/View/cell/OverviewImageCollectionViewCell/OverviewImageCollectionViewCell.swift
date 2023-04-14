//
//  OverviewImageCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import UIKit

class OverviewImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var overviewImageView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureContentContainerView()
        configureImageView()
    }
    
    private func configureContentContainerView() {
        contentContainerView.backgroundColor = Colors.Theme.mainColor
        contentContainerView.clipsToBounds = true
        contentContainerView.layer.borderColor = Colors.Button.primaryColor?.cgColor
        contentContainerView.layer.borderWidth = 1.0
        contentContainerView.layer.cornerRadius = 4
    }
    
    private func configureImageView() {
        overviewImageView.contentMode = .scaleAspectFit
    }
    
    func renderUI(url: String) {
        overviewImageView.kf.setImage(with: URL(string: url))
    }

}
