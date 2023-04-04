//
//  FilterSettingTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import UIKit

class FilterSettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filerSettingTitleLabel: UILabel!
    @IBOutlet weak var selectionImageView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static let cellHeight: CGFloat = 40.0

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
        configureContentContainerView()
        configureSettingTitleLabel()
        configureSelectionImageView()
    }
    
    private func configureContentContainerView() {
        contentView.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureSettingTitleLabel() {
        filerSettingTitleLabel.text = "All(Default)"
        filerSettingTitleLabel.font = Fonts.titleFont
        filerSettingTitleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureSelectionImageView() {
        selectionImageView.contentMode = .scaleAspectFill
        selectionImageView.image = Images.FilterSettings.selectedIcon
    }
    
    @discardableResult
    func set(settingName: String) -> Self {
        filerSettingTitleLabel.text = settingName
        return self
    }
    
    @discardableResult
    func set(isSelected: Bool) -> Self {
        selectionImageView.image = isSelected ? Images.FilterSettings.selectedIcon : Images.FilterSettings.unselectedIcon
        return self
    }
    
}
