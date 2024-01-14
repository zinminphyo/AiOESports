//
//  ShieldAmountCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/01/2024.
//

import UIKit

class ShieldAmountCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) var shieldAmountImageView: UIImageView!
    @IBOutlet private(set) var shieldAmountLabel: UILabel!
    @IBOutlet private(set) var totalCostLabel: UILabel!
    @IBOutlet private(set) var totalExtraLabel: UILabel!
    
    lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func render(shield: BuyShieldsResponse.ShieldAmount) {
        shieldAmountLabel.text = String(format: "%@ Shields", shield.amount)
        totalCostLabel.text = formatter.string(from: (Int(shield.total_price) ?? 0) as NSNumber)
        totalExtraLabel.text = String(format: "%@ Extra", shield.extra ?? "")
    }

}
