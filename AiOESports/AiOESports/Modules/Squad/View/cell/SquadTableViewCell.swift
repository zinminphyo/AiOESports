//
//  SquadTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class SquadTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static let cellHeight: CGFloat = 56
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!

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
        self.backgroundColor = Colors.Theme.inputColor
        mainImageView.layer.cornerRadius = 10
        nameLabel.font = Fonts.titleFont
        nameLabel.textColor = Colors.Text.primaryText
        locationLabel.font = Fonts.subtitleFont
        locationLabel.textColor = Colors.Text.primaryText
        nameLabel.text = "PVNDV"
        locationLabel.text = "Yangon"
        countryImageView.image = Images.countryImage
        mainImageView.image = Images.TeamImages.teamlogo
    }
    
}
