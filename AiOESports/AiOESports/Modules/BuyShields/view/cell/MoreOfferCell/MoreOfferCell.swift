//
//  MoreOfferCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit

class MoreOfferCell: UICollectionViewCell {
    
    var tappedMoreOffer: () -> () = {}
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction
    private func didTapMoreOffer(_ sender: UIButton) {
        tappedMoreOffer()
    }

}
