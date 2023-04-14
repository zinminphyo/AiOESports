//
//  SquadTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit
import Kingfisher

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
        nameLabel.font = Fonts.ForCell.titleFont
        nameLabel.textColor = Colors.Text.primaryText
        locationLabel.font = Fonts.ForCell.subtitleFont
        locationLabel.textColor = Colors.Text.primaryText
        nameLabel.text = "PVNDV"
        locationLabel.text = "Yangon"
        countryImageView.image = Images.countryImage
        mainImageView.image = Images.TeamImages.teamlogo
    }
    
    @discardableResult
    func set(coach: CoachModel?) -> Self {
        nameLabel.text = coach?.name ?? ""
        mainImageView.kf.setImage(with: URL(string: coach?.playerImageFullURL ?? ""))
        locationLabel.text = coach?.city ?? ""
        return self
    }
    
    @discardableResult
    func set(roster: RosterModel?) -> Self {
        nameLabel.text = roster?.name ?? ""
        locationLabel.text = roster?.city ?? ""
        mainImageView.kf.setImage(with: URL(string: roster?.playerImageFullURL ?? ""))
        return self
    }
    
    @discardableResult
    func set(achivement: AchivementModel) -> Self {
        nameLabel.text = achivement.name
        locationLabel.text = achivement.place
        mainImageView.kf.setImage(with: URL(string: achivement.logoFullPath))
        return self
    }
    
}
