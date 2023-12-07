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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.layer.cornerRadius = ( bounds.height * 0.8 ) / 2
        print("HEIGHT ====> \(bounds.height)")
        profileImageView.layer.cornerCurve = .continuous
    }
    
    func set(imageURL: String) {
        loadingView.showLoading()
        profileImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(imageURL)"), placeholder: Images.Placeholder.cover) { [weak self] _ in
            guard let self = self else { return }
            loadingView.hideLoading()
        }
    }
    
    func set(image: UIImage?) {
        profileImageView.image = image
    }

}
