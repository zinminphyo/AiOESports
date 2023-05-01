//
//  UploadProfile.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/05/2023.
//

import UIKit

class UploadProfile: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var levelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var takePhotoBtn: UIButton!
    @IBOutlet weak var configureChooseFromGalleryBtn: UIButton!
    @IBOutlet weak var skipForNowBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    private func configureHierarchy() {
        confiugreTitleLabel()
        configureTakephotoBtn()
        configureChooseFromCameraRollBtn()
        configureSkipForNowBtn()
        configureNextBtn()
    }
    
    private func confiugreTitleLabel() {
        titleLabel.textColor = Colors.Text.primaryText
        titleLabel.text = "Upload Profile"
        titleLabel.font = Fonts.titleFont
    }
    
    private func configureTakephotoBtn() {
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Take Photo"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            takePhotoBtn.configuration = configuration
        } else {
            takePhotoBtn.setTitle("Take Photo", for: .normal)
            takePhotoBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            takePhotoBtn.titleLabel?.font = Fonts.subtitleFont
        }
        
        takePhotoBtn.backgroundColor = Colors.Theme.inputColor
        takePhotoBtn.layer.borderColor = Colors.Text.primaryText?.cgColor
        takePhotoBtn.layer.borderWidth = 0.5
        takePhotoBtn.layer.cornerRadius = 10
        takePhotoBtn.addTarget(self, action: #selector(didTapTakePhotoBtn), for: .touchUpInside)
    }
    
    private func configureChooseFromCameraRollBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Choose From Gallery Roll"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            configureChooseFromGalleryBtn.configuration = configuration
        } else {
            configureChooseFromGalleryBtn.setTitle("Choose From Gallery Roll", for: .normal)
            configureChooseFromGalleryBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            configureChooseFromGalleryBtn.titleLabel?.font = Fonts.subtitleFont
        }
        configureChooseFromGalleryBtn.backgroundColor = Colors.Theme.inputColor
        configureChooseFromGalleryBtn.layer.borderColor = Colors.Text.primaryText?.cgColor
        configureChooseFromGalleryBtn.layer.borderWidth = 0.5
        configureChooseFromGalleryBtn.layer.cornerRadius = 10
        configureChooseFromGalleryBtn.addTarget(self, action: #selector(didTapChooseFromGalleryBtn), for: .touchUpInside)
    }
    
    private func configureSkipForNowBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Skip For Now"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            skipForNowBtn.configuration = configuration
        } else {
            skipForNowBtn.setTitle("Skip For Now", for: .normal)
            skipForNowBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            skipForNowBtn.titleLabel?.font = Fonts.subtitleFont
        }
        skipForNowBtn.backgroundColor = Colors.Theme.inputColor
        skipForNowBtn.layer.borderColor = Colors.Text.primaryText?.cgColor
        skipForNowBtn.layer.borderWidth = 0.5
        skipForNowBtn.layer.cornerRadius = 10
        skipForNowBtn.addTarget(self, action: #selector(didTapSkipForNow), for: .touchUpInside)
    }
    
    private func configureNextBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Next"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            nextBtn.configuration = configuration
        } else {
            nextBtn.setTitle("Next", for: .normal)
            nextBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            nextBtn.titleLabel?.font = Fonts.subtitleFont
        }
        nextBtn.backgroundColor = Colors.Button.primaryColor?.withAlphaComponent(0.4)
        nextBtn.layer.cornerRadius = 10
        nextBtn.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
    }
    
    
    @objc func didTapTakePhotoBtn() {
        
    }
    
    @objc func didTapChooseFromGalleryBtn() {
        
    }
    
    
    @objc func didTapSkipForNow() {
        
    }
    
    @objc func didTapNextBtn() {
        
    }

}
