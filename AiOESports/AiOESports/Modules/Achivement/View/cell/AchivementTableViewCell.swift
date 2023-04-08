//
//  AchivementTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class AchivementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var achivementImageView: UIImageView!
    @IBOutlet weak var achivementNameLabel: UILabel!
    @IBOutlet weak var achivementTireLabel: UILabel!
    @IBOutlet weak var achivementPlaceLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static let cellHeight: CGFloat = 50

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
        achivementImageView.contentMode = .scaleAspectFill
        achivementNameLabel.font = Fonts.ForCell.titleFont
        achivementNameLabel.textColor = Colors.Text.primaryText
        achivementNameLabel.text = "Real Cup 2023 : Season 2"
        achivementTireLabel.font = Fonts.ForCell.subtitleFont
        achivementTireLabel.textColor = Colors.Text.primaryText
        achivementTireLabel.text = "B-Tier"
        achivementPlaceLabel.font = Fonts.ForCell.subtitleFont
        achivementPlaceLabel.textColor = Colors.Text.primaryText
        achivementPlaceLabel.text = "5th - 6th Place"
    }
    
}
