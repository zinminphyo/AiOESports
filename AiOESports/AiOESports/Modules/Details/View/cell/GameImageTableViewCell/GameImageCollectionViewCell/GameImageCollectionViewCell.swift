//
//  GameImageCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/04/2023.
//

import UIKit

class GameImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
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
        imageView.contentMode = .scaleAspectFill
    }
    
    func set(gameName: String) {
        imageView.image = Images.GameLogo.getImage(gameName: gameName)
    }
    

}
