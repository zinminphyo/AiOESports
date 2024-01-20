//
//  RankCellWithCoverCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/12/2023.
//

import UIKit
import Kingfisher

class RankCellWithCoverCell: UITableViewCell {
    
    @IBOutlet private(set) var coverImageView: UIImageView!
    @IBOutlet private(set) var mainImageView: UIImageView!
    @IBOutlet private(set) var teamNameLabel: UILabel!
    @IBOutlet private(set) var gameImageView: UIImageView!
    @IBOutlet private(set) var cityNameLabel: UILabel!
    @IBOutlet private(set) var rankLabel: UILabel!
    @IBOutlet private(set) var ratingLabel: UILabel!
    @IBOutlet private(set) var currentTeamImageView: UIImageView!
    @IBOutlet private(set) var teamContainerView: UIView!
    
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
    }
    
    
    @discardableResult
    func render(rank: RankListsView.RankModel) -> Self {
        mainImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(rank.imageURL)"))
        teamNameLabel.text = rank.name
        gameImageView.image = Images.GameImages.getImage(gameName: rank.game)
        cityNameLabel.text = rank.location
        rankLabel.text = rank.rank
        rankLabel.textColor = rank.rankColor
        rankLabel.font = rank.font
        ratingLabel.text = rank.rating
        currentTeamImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(rank.currentTeam ?? "")"), placeholder: Images.Placeholder.profile)
        teamContainerView.isHidden = rank.currentTeam == nil
        return self
    }
    
    @discardableResult
    func render(coverImageURL: String) -> Self {
        coverImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(coverImageURL)"), placeholder: Images.Placeholder.cover)
        return self
    }
    
}
