//
//  OverviewTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var overviewTitleLabel: UILabel!
    @IBOutlet weak var overviewImageView: UIImageView!
    @IBOutlet weak var overviewValueLabel: UILabel!
    
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
        configureTitleLabel()
        configureValueLabel()
        configureImageView()
    }
    
    private func configureContainerView() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTitleLabel() {
        overviewTitleLabel.font = Fonts.ForCell.subtitleFont
        overviewTitleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureValueLabel() {
        overviewValueLabel.font = Fonts.ForCell.titleFont
        overviewValueLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureImageView() {
        overviewImageView.contentMode = .scaleAspectFit
    }
    
    
    func render(title: String, value: String, imageURL: String?) {
        overviewTitleLabel.text = title
        overviewValueLabel.text = value
        overviewImageView.isHidden = imageURL == nil
        if let url = imageURL {
            overviewImageView.kf.setImage(with: URL(string: url))
        }
    }
    
}
