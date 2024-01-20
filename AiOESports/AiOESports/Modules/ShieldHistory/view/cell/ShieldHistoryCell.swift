//
//  ShieldHistoryCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 20/01/2024.
//

import UIKit

class ShieldHistoryCell: UITableViewCell {
    
    @IBOutlet private(set) var dateTimeLabel: UILabel!
    @IBOutlet private(set) var descriptionLabel: UILabel!
    @IBOutlet private(set) var amountLabel: UILabel!
    @IBOutlet private(set) var detailsLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    static var height: CGFloat {
        return 50.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
}
