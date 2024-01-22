//
//  CommentPreview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit
import Kingfisher

class CommentPreview: UIView, NibLoadable {
    
    @IBOutlet private(set) var profileView: ProfileLevelView!
    @IBOutlet private(set) var badgeImageView: UIImageView!
    @IBOutlet private(set) var profileNameLabel: UILabel!
    @IBOutlet private(set) var commentTextLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }
    
    @discardableResult
    func set(url: String, level: String) -> Self {
        profileView.set(imageURL: url)
        profileView.set(level: level)
        profileNameLabel.textColor = level.lowercased() == "free" ? Colors.Text.primaryText : Colors.Text.goldText
        return self
    }
    
    @discardableResult
    func set(name: String) -> Self {
        profileNameLabel.text = name
        return self
    }
    
    @discardableResult
    func set(comment: String) -> Self {
        commentTextLabel.text = comment
        return self
    }
    
    @discardableResult
    func set(badge: String) -> Self {
        badgeImageView.image = Images.badgeImage(badge)
        return self
    }
    
}
