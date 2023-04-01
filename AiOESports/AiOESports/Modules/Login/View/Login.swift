//
//  Login.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var pinView: PinView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var rememberInfoLabel: UILabel!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var donotHaveAccountTitleLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pinView.delegate = self
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureBackgroundColor()
        configureTitleLabel()
        configureSubtitleLabel()
        configurePhoneNumberLabel()
        configurePasswordLabel()
        configureLoginButton()
        configureDonotHaveAccountLabel()
        configureRegisterButton()
    }
    
    private func configureBackgroundColor() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    
    private func configureTitleLabel() {
        titleLabel.text = "Login in"
        titleLabel.font = Fonts.titleFont
        titleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureSubtitleLabel() {
        subtitleLabel.text = "Welcome back"
        subtitleLabel.font = Fonts.subtitleFont
        subtitleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configurePhoneNumberLabel() {
        phoneNumberLabel.text = "Phone Number"
        phoneNumberLabel.font = Fonts.subtitleFont
        phoneNumberLabel.textColor = Colors.Text.primaryText
    }
    
    private func configurePasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.font = Fonts.subtitleFont
        passwordLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureLoginButton() {
        if #available(iOS 14.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Log in"
            var container = AttributeContainer()
            container.font = Fonts.titleFont
            container.foregroundColor = Colors.Text.primaryText
            configuration.attributedTitle = AttributedString("Log in", attributes: container)
            loginButton.configuration = configuration
        } else {
            loginButton.setTitle("Log in", for: .normal)
            loginButton.titleLabel?.font = Fonts.titleFont
            loginButton.titleLabel?.textColor = Colors.Text.primaryText
        }
    }
    
    private func configureDonotHaveAccountLabel() {
        donotHaveAccountTitleLabel.text = "Don't have an account?"
        donotHaveAccountTitleLabel.font = Fonts.subtitleFont
        donotHaveAccountTitleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureRegisterButton() {
        if #available(iOS 14.0, *) {
            var configuration = UIButton.Configuration.plain()
            var container = AttributeContainer()
            container.font = Fonts.titleFont
            container.foregroundColor = Colors.Text.primaryText
            configuration.attributedTitle = AttributedString("Register", attributes: container)
            registerButton.configuration = configuration
        } else {
            registerButton.setTitle("Register", for: .normal)
            registerButton.titleLabel?.font = Fonts.titleFont
            registerButton.titleLabel?.textColor = Colors.Text.primaryText
        }
    }

}


extension Login: PinViewDelegate {
    func didFinishedConfirmCode(isMatched: Bool) {
        print("IsMatched Flag => \(isMatched)")
    }
    func didFinishedEnterCode() {
        print("Enter Code.")
    }
}
