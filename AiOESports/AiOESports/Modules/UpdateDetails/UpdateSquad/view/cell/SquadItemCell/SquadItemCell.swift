//
//  SquadItemCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/01/2024.
//

import UIKit
import Kingfisher

class SquadItemCell: UITableViewCell {
    
    @IBOutlet private(set) var playerImageView: UIImageView!
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var laneContainerView: UIView!
    @IBOutlet private(set) var laneImageView: UIImageView!
    @IBOutlet private(set) var countryImageView: UIImageView!
    @IBOutlet private(set) var cityNameLabel: UILabel!
    
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
    
    func render(_ player: UpdateSquadTableViewCell.Player_Of_Squad) {
        playerImageView.kf.setImage(with: URL(string: player.imageURL))
        nameLabel.text = player.name
        laneImageView.kf.setImage(with: URL(string: player.lane ?? ""))
        laneContainerView.isHidden = player.lane == nil
        countryImageView.kf.setImage(with: URL(string: player.country))
        cityNameLabel.text = player.city
    }
    
}
