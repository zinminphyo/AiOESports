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
    @IBOutlet private(set) var laneIconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet private(set) var locationContainerView: UIView!
    @IBOutlet private(set) var teamInfoContainerView: UIStackView!
    @IBOutlet private(set) var teamNameLabel: UILabel!
    @IBOutlet private(set) var teamImageView: UIImageView!


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
        self.backgroundColor = Colors.Theme.SecondaryBackground
        mainImageView.layer.cornerRadius = 10
//        nameLabel.font = Fonts.ForCell.titleFont
        nameLabel.textColor = Colors.Text.primaryText
//        locationLabel.font = Fonts.ForCell.subtitleFont
        locationLabel.textColor = Colors.Text.primaryText
        nameLabel.text = "PVNDV"
        locationLabel.text = "Yangon"
//        countryImageView.image = Images.countryImage
        mainImageView.image = Images.TeamImages.teamlogo
    }
    
    @discardableResult
    func set(coach: CoachModel?) -> Self {
        nameLabel.text = coach?.name ?? ""
        mainImageView.kf.setImage(with: URL(string: coach?.playerImageFullURL ?? ""), placeholder: Images.Placeholder.profile)
        locationLabel.text = coach?.city ?? ""
        laneIconImageView.isHidden = true
        countryImageView.kf.setImage(with: URL(string: coach?.countryImageFullURL ?? ""))
        return self
    }
    
    @discardableResult
    func set(roster: RosterModel?) -> Self {
        nameLabel.text = roster?.name ?? ""
        locationLabel.text = roster?.city ?? ""
        mainImageView.kf.setImage(with: URL(string: roster?.playerImageFullURL ?? ""), placeholder: Images.Placeholder.profile)
        laneIconImageView.isHidden = roster?.lane == nil
        laneIconImageView.kf.setImage(with: URL(string: roster?.laneImageFullURL ?? ""))
        countryImageView.kf.setImage(with: URL(string: roster?.countryImageFullURL ?? ""))
        return self
    }
    
    @discardableResult
    func set(achivement: AchivementModel) -> Self {
        nameLabel.text = achivement.name
        locationLabel.text = String(format: "%@ • %@", achivement.tier, achivement.renderablePlace)
        locationLabel.textColor = achivement.placeColor
        mainImageView.kf.setImage(with: URL(string: achivement.logoFullPath), placeholder: Images.Placeholder.profile)
        laneIconImageView.isHidden = true
        locationContainerView.isHidden = true
        teamImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(achivement.teamImage)"))
        teamNameLabel.text = achivement.teamName
        teamInfoContainerView.isHidden = achivement.teamId == 0
        return self
    }
    
}
