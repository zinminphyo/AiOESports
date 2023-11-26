//
//  ProfileLevelView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import Kingfisher

class ProfileLevelView: UIView, NibLoadable {
    
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var profileImageView: UIImageView!
    @IBOutlet private(set) var profileLeveleImageView: UIImageView!
    
    
    @IBInspectable var isLoading: Bool {
        set {
            newValue ? loadingView.showLoading() : loadingView.hideLoading()
        }
        get { loadingView.isHidden }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }
    
    func set(imageURL: String) {
        profileImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(imageURL)"))
    }
    
    func set(image: UIImage?) {
        profileImageView.image = image
    }

}
