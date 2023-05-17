//
//  PhNumTableCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/05/2023.
//

import UIKit

class PhNumTableCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        selectionStyle = .none
    }
    
    private func configureHierarchy() {
        configureTitleLabel()
        configureSubtitleLabel()
    }
    
    private func configureTitleLabel() {
        titleLabel.font = Fonts.titleFont
        titleLabel.text = "Phone Number"
        titleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureSubtitleLabel() {
        subtitleLabel.font = Fonts.subtitleFont
        subtitleLabel.text = "Get code from 09781234567"
        subtitleLabel.textColor = Colors.Text.primaryText
    }
    
}
