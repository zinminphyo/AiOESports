//
//  GameSortingCategoryCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class GameSortingCategoryCell: UITableViewCell {
    
    @IBOutlet private(set) var gameTypeImageView: UIImageView!
    @IBOutlet private(set) var gameNameLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    @discardableResult
    func render(gameImage: UIImage?) -> Self {
        gameTypeImageView.image = gameImage
        return self
    }
    
    @discardableResult
    func render(gameName: String) -> Self {
        gameNameLabel.text = gameName
        return self
    }

    
}
