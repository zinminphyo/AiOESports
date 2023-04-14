//
//  FormerPlayerTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit
import Kingfisher

class FormerPlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var currentTeamImageView: UIImageView!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var fromValueLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var toValueLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static let cellHeight: CGFloat = 50.0

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
        configureContainerView()
        configurePlayerImageView()
        configureNameLabel()
        configureCityImageLabel()
        configureFormContainerView()
        configureToContainerView()
    }
    
    private func configureContainerView() {
        self.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configurePlayerImageView() {
        playerImageView.layer.cornerRadius = 8
        playerImageView.contentMode = .scaleAspectFill
    }
    
    private func configureNameLabel() {
        playerNameLabel.font = Fonts.ForCell.titleFont
        playerNameLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureCityImageLabel() {
        cityNameLabel.text = "Yangon"
        cityNameLabel.font = Fonts.ForCell.subtitleFont
        cityNameLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureFormContainerView() {
        fromLabel.textColor = Colors.Text.secondaryText
        fromLabel.text = "From - "
        fromLabel.font = Fonts.ForCell.subtitleFont
        
        fromValueLabel.textColor = Colors.Text.primaryText
        fromValueLabel.font = Fonts.ForCell.subtitleFont
        fromValueLabel.text = " Jun 2021"
    }
    
    private func configureToContainerView() {
        toLabel.textColor = Colors.Text.secondaryText
        toLabel.text = "From - "
        toLabel.font = Fonts.ForCell.subtitleFont
        
        toValueLabel.textColor = Colors.Text.primaryText
        toValueLabel.font = Fonts.ForCell.subtitleFont
        toValueLabel.text = " Jun 2021"
    }
    
    func updateUI(formerPlayer: FormerPlayerModel) {
        playerImageView.kf.setImage(with: URL(string: formerPlayer.playerImageFullPath))
        playerNameLabel.text = formerPlayer.name
        cityNameLabel.text = formerPlayer.city
        locationImageView.kf.setImage(with: URL(string: formerPlayer.locationImageFullPath))
        currentTeamImageView.kf.setImage(with: URL(string: formerPlayer.teamImageFullPath))
        fromValueLabel.text = formerPlayer.fromTime
        toValueLabel.text = formerPlayer.toTime
    }
    
    func updateUI(careerModel: CareerModel) {
        playerImageView.kf.setImage(with: URL(string: careerModel.teamImageFullPath))
        playerNameLabel.text = careerModel.teamName
        cityNameLabel.text = careerModel.city
        locationImageView.kf.setImage(with: URL(string: careerModel.locationImageFullPath))
        fromValueLabel.text = careerModel.fromTime
        toValueLabel.text = careerModel.toTime
        currentTeamImageView.isHidden = true
    }
}
