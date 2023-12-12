//
//  FollowAndVoteCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/12/2023.
//

import UIKit
import Kingfisher

class FollowAndVoteListCell: UITableViewCell {
    
    
    @IBOutlet private(set) var profileImageView: UIImageView!
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var loading: UIActivityIndicatorView!
    
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
        backgroundColor = nil
        backgroundView = nil
        selectionStyle = .none
    }
    
    
    func render(model: FollowAndVoteListsViewModel.FollowAndVoteModel) {
        loading.startAnimating()
        profileImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(model.imageURL)")) { [weak self] _ in
            guard let self = self else { return }
            self.loading.stopAnimating()
        }
        nameLabel.text = model.name
    }
}
