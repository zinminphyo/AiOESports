//
//  RankCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/12/2023.
//

import UIKit

class RankCell: UITableViewCell {
    
    @IBOutlet private(set) var mainImageView: UIImageView!
    @IBOutlet private(set) var teamNameLabel: UILabel!
    @IBOutlet private(set) var gameImageView: UIImageView!
    @IBOutlet private(set) var cityNameLabel: UILabel!
    @IBOutlet private(set) var rankLabel: UILabel!
    @IBOutlet private(set) var ratingLabel: UILabel!
    @IBOutlet private(set) var ratingView: UIStackView!
    @IBOutlet private(set) var currentTeamImage: UIImageView!
    @IBOutlet private(set) var teamImageContainerView: UIView!
    
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
    
    func render(rank: RankListsView.RankModel) {
        mainImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(rank.imageURL)"), placeholder: Images.Placeholder.profile)
        teamNameLabel.text = rank.name
        gameImageView.image = Images.GameImages.getImage(gameName: rank.game)
        cityNameLabel.text = rank.location
        rankLabel.text = rank.rank
        rankLabel.textColor = rank.rankColor
        rankLabel.font = rank.font
        ratingLabel.text = rank.rating
        ratingView.isHidden = Int(rank.rating) == 0
        currentTeamImage.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(rank.currentTeam ?? "")"))
        teamImageContainerView.isHidden = rank.currentTeam == nil
    }
    
}
