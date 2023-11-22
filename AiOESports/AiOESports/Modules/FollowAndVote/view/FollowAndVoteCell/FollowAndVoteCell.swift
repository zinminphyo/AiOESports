//
//  FollowAndVoteCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class FollowAndVoteCell: UITableViewCell {
    
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
    
}
