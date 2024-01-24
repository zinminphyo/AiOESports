//
//  ADCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 24/01/2024.
//

import UIKit
import Kingfisher

class ADCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) var adImageView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func render(_ url: String) {
        adImageView.kf.setImage(with: URL(string: url), placeholder: Images.Placeholder.cover)
    }

}
