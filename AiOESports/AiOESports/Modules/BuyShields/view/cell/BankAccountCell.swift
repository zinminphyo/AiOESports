//
//  BankAccountCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/01/2024.
//

import UIKit

class BankAccountCell: UICollectionViewCell {
    
    @IBOutlet private var selectionImageView: UIImageView!
    
    
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func render(isSelected: Bool) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.selectionImageView.image = isSelected ? UIImage(named: "selected") : UIImage(named: "unselected")
        }
    }

}
