//
//  CommentPreview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit
import Kingfisher

class CommentPreview: UIView, NibLoadable {
    
    @IBOutlet private(set) var profileImageView: UIImageView!
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
    func set(url: String) -> Self {
        profileImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)\(url)"))
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
    
}
