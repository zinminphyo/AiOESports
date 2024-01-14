//
//  AccountCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/01/2024.
//

import UIKit

class AccountCell: UITableViewCell {
    
    let pasteBoard = UIPasteboard.general
    
    @IBOutlet private(set) var paymentNameLabe: UILabel!
    @IBOutlet private(set) var accountNumberLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
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
    
    @IBAction
    private func didTapCopy(_ sender: UIButton) {
        pasteBoard.string = accountNumberLabel.text
    }
    
    func render(_ payment: BuyShieldsResponse.Payment) {
        paymentNameLabe.text = payment.name
        accountNumberLabel.text = payment.acc_number
    }
    
}
