//
//  CommentTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) var profileImageView: UIImageView!
    @IBOutlet private(set) var profileNameLabel: UILabel!
    @IBOutlet private(set) var minAgoLabel: UILabel!
    @IBOutlet private(set) var ratingView: RatingView!
    @IBOutlet private(set) var commentLabel: UILabel!
    
    
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
