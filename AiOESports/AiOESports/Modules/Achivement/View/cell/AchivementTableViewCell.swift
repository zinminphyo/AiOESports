//
//  AchivementTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit
import Kingfisher

class AchivementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var achivementImageView: UIImageView!
    @IBOutlet weak var achivementNameLabel: UILabel!
    @IBOutlet weak var achivementTireLabel: UILabel!
    @IBOutlet weak var achivementPlaceLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static let cellHeight: CGFloat = 65

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
        achivementNameLabel.font = UIFont(name: "DMSans-Medium", size: 16)
        achivementNameLabel.textColor = Colors.Text.primaryText
        achivementNameLabel.text = "Real Cup 2023 : Season 2"
        achivementTireLabel.font = UIFont(name: "DMSans-Regular", size: 12)
        achivementTireLabel.textColor = Colors.Text.secondaryText
        achivementTireLabel.text = "B-Tier"
        achivementPlaceLabel.font = UIFont(name: "DMSans-Regular", size: 12)
        achivementPlaceLabel.textColor = Colors.Text.secondaryText
        achivementPlaceLabel.text = "5th - 6th Place"
    }
    
    func renderUI(achivement: AchivementModel) {
        achivementImageView.kf.setImage(with: URL(string: achivement.logoFullPath))
        achivementNameLabel.text = achivement.name
        achivementTireLabel.text = achivement.tier
        achivementPlaceLabel.text = achivement.renderablePlace
        achivementPlaceLabel.textColor = achivement.placeColor
    }
    
}
