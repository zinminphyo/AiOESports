//
//  SearchTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchMainImageView: UIImageView!
    @IBOutlet weak var gameTypeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

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
        configureMainImageView()
        configureGameImageView()
        configureNameLabel()
    }
    
    private func configureContainerView() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureMainImageView() {
        searchMainImageView.layer.cornerRadius = 5
        searchMainImageView.contentMode = .scaleAspectFill
    }
    
    private func configureGameImageView() {
        gameTypeImageView.contentMode = .scaleAspectFill
    }
    
    private func configureNameLabel() {
        nameLabel.font = Fonts.subtitleFont
        nameLabel.textColor = Colors.Text.primaryText
    }
    
    @discardableResult
    func set(forTeam: TeamSearchResultModel) -> Self {
        searchMainImageView.kf.setImage(with: URL(string: forTeam.teamImageFullURL))
        gameTypeImageView.image = GameType.MobileLegend.image
        nameLabel.text = forTeam.teamName
        return self
    }
    
}
