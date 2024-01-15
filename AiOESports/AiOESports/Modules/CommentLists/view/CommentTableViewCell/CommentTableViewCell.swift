//
//  CommentTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit
import Kingfisher

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) var profileImageView: UIImageView!
    @IBOutlet private(set) var profileNameLabel: UILabel!
    @IBOutlet private(set) var minAgoLabel: UILabel!
    @IBOutlet private(set) var ratingView: RatingView!
    @IBOutlet private(set) var commentLabel: UILabel!
    
    @IBOutlet private(set) var oneStarImageView: UIImageView!
    @IBOutlet private(set) var twoStarImageView: UIImageView!
    @IBOutlet private(set) var threeStarImageView: UIImageView!
    @IBOutlet private(set) var fourStarImageView: UIImageView!
    @IBOutlet private(set) var fiveStarImageView: UIImageView!
    
    /* 2023-10-14T07:40:09.000000Z */
    lazy var serverFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSSSSZ"
        return formatter
    }()
    
    lazy var localeFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
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
    
    func render(_ rating: Rating) {
        profileImageView.kf.setImage(with: URL(string: rating.profileImageFullPath), placeholder: Images.Placeholder.profile)
        profileNameLabel.text = rating.username
        minAgoLabel.text = localeFormatter.string(from: serverFormatter.date(from: rating.created_at) ?? Date())
        commentLabel.text = rating.comment
        updateStars(count: rating.star)
    }
    
    private func updateStars(count: Int) {
        let starImages: [UIImageView] = [
            oneStarImageView, twoStarImageView, threeStarImageView, fourStarImageView, fiveStarImageView
        ]
        let selectedStarCount = 0..<count
        starImages.forEach{ $0.image = UIImage(named: "star-unfill") }
        selectedStarCount.forEach{ starImages[$0].image = UIImage(named: "star-fill") }
    }
    
}
