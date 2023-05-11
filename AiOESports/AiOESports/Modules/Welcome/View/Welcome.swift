//
//  Welcome.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/05/2023.
//

import UIKit

class Welcome: UIViewController {

    @IBOutlet weak var skipForNowBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureSkipForNowBtn()
        configureContinueBtn()
    }
    
    private func configureSkipForNowBtn() {
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Skip for now"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            skipForNowBtn.configuration = configuration
        } else {
            skipForNowBtn.setTitle("Skip for now", for: .normal)
            skipForNowBtn.titleLabel?.font = Fonts.subtitleFont
            skipForNowBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        skipForNowBtn.addTarget(self, action: #selector(didTapSkipBtn), for: .touchUpInside)
        skipForNowBtn.layer.cornerRadius = 10
        skipForNowBtn.backgroundColor = Colors.Button.secondaryColor
        skipForNowBtn.layer.borderWidth = 0.5
        skipForNowBtn.layer.borderColor = Colors.Button.strokeColor?.cgColor
    }
    
    private func configureContinueBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Continue"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            continueBtn.configuration = configuration
        } else {
            continueBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            continueBtn.titleLabel?.font = Fonts.subtitleFont
            continueBtn.setTitle("Continue", for: .normal)
        }
        continueBtn.backgroundColor = Colors.Button.primaryColor
        continueBtn.layer.cornerRadius = 10
        continueBtn.addTarget(self, action: #selector(didTapContinueBtn), for: .touchUpInside)
    }
    
    
    @objc func didTapSkipBtn() {
        guard let vc = InAppModule.createModule() else { return }
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        sceneDelegate.window?.rootViewController = vc
    }

    @objc func didTapContinueBtn() {
        
    }
}
