//
//  BankAccountCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/01/2024.
//

import UIKit

class BankAccountCell: UICollectionViewCell {
    
    @IBOutlet private(set) var selectionBackgroundView: UIView!
    
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
            self.selectionBackgroundView.backgroundColor = isSelected ? Colors.Theme.SecondaryBackground : Colors.Theme.mainColor
        }
    }

}
