//
//  LoginOrRegister.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 20/04/2023.
//

import UIKit

class LoginOrRegister: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var continueAsGuestButton: UIButton!
    @IBOutlet weak var termsAndConditionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureContainerView()
        configureLoginButton()
        configureRegisterButton()
        configureGuestButton()
        configureTermsAndConditionLabel()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureLoginButton() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Log in with Phone Number"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.foregroundColor = Colors.Text.primaryText
                outgoing.font = Fonts.subtitleFont
                return outgoing
            }
            loginButton.configuration = configuration
        } else {
            loginButton.setTitle("Log in with Phone Number", for: .normal)
            loginButton.titleLabel?.font = Fonts.subtitleFont
            loginButton.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = Colors.Button.primaryColor
        loginButton.addTarget(self, action: #selector(didTapLoginWithPhoneNumberBtn), for: .touchUpInside)
    }
    
    private func configureRegisterButton() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Register"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            registerButton.configuration = configuration
        } else {
            registerButton.setTitle("Register", for: .normal)
            registerButton.setTitleColor(Colors.Text.primaryText, for: .normal)
            registerButton.titleLabel?.font = Fonts.subtitleFont
        }
        registerButton.backgroundColor = Colors.Theme.inputColor
        registerButton.layer.borderColor = Colors.Text.primaryText?.cgColor
        registerButton.layer.borderWidth = 0.5
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(didTapRegisterBtn), for: .touchUpInside)
    }
    
    private func configureGuestButton() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Continue as Guest"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.foregroundColor = Colors.Text.primaryText
                outgoing.font = Fonts.subtitleFont
                return outgoing
            }
            continueAsGuestButton.configuration = configuration
        } else {
            continueAsGuestButton.setTitle("Continue as Guest", for: .normal)
            continueAsGuestButton.titleLabel?.font = Fonts.subtitleFont
            continueAsGuestButton.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        continueAsGuestButton.backgroundColor = Colors.Theme.inputColor
        continueAsGuestButton.layer.borderColor = Colors.Text.primaryText?.cgColor
        continueAsGuestButton.layer.borderWidth = 0.5
        continueAsGuestButton.layer.cornerRadius = 10
        continueAsGuestButton.addTarget(self, action: #selector(didTapContinueAsGuestBtn), for: .touchUpInside)
    }
    
    private func configureTermsAndConditionLabel() {
        termsAndConditionLabel.text = "By using the app, you agree to our Terms of Service and Privacy Policy."
        termsAndConditionLabel.textColor = Colors.Text.secondaryText
        termsAndConditionLabel.font = Fonts.subtitleFont
        termsAndConditionLabel.textAlignment = .center
        termsAndConditionLabel.numberOfLines = 0
    }
    
    @objc func didTapLoginWithPhoneNumberBtn() {
        guard let loginVC = LoginModule.createModule() else { return }
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc func didTapRegisterBtn() {
        guard let vc = RegisterModule.createModule() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapContinueAsGuestBtn() {
        
    }
}
