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
    @IBOutlet weak var incorrectPhoneNumberLabel: UILabel!
    @IBOutlet weak var incorrectPinLabel: UILabel!
    @IBOutlet weak var incorrectPasswordContainerView: UIView!
    @IBOutlet weak var incorrectPhoneNumberContainerView: UIView!
    @IBOutlet weak var rememberInfoLabel: UILabel!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var rememberInfoFlagImageView: UIImageView!
    @IBOutlet weak var saveInfoContainerView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var donotHaveAccountTitleLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var phoneNumberView: PhoneNumberView!
    
    var presenter: LoginPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pinView.delegate = self
        pinView.state = .enter
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureBackgroundColor()
        configureTitleLabel()
        configureSubtitleLabel()
        configurePhoneNumberLabel()
        configurePasswordLabel()
        configureLoginButton()
        configurePhoneNumberView()
        configureDonotHaveAccountLabel()
        configureRegisterButton()
        configurePhoneNumberErrorContainerView()
        configurePasswordErrorContainerView()
        configureSaveInfoView()
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
    
    private func configurePhoneNumberErrorContainerView() {
        incorrectPhoneNumberContainerView.isHidden = false
        incorrectPhoneNumberContainerView.backgroundColor = UIColor.clear
        incorrectPhoneNumberLabel.textColor = Colors.Text.incorrectText
        incorrectPhoneNumberLabel.text = "Your phone number is wrong. Please try again."
        incorrectPhoneNumberLabel.font = Fonts.subtitleFont
        incorrectPhoneNumberLabel.numberOfLines = 0
        incorrectPhoneNumberLabel.isHidden = true
    }
    
    private func configurePasswordErrorContainerView() {
        incorrectPasswordContainerView.isHidden = false
        incorrectPasswordContainerView.backgroundColor = UIColor.clear
        incorrectPinLabel.textColor = Colors.Text.incorrectText
        incorrectPinLabel.text = "Your password is wrong. Please try again."
        incorrectPinLabel.font = Fonts.subtitleFont
        incorrectPinLabel.numberOfLines = 0
        incorrectPinLabel.isHidden = true
    }
    
    private func configurePasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.font = Fonts.subtitleFont
        passwordLabel.textColor = Colors.Text.primaryText
    }
    
    private func configurePhoneNumberView() {
        phoneNumberView.delegate = self
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
        loginButton.backgroundColor = Colors.Button.primaryColor?.withAlphaComponent(0.4)
        loginButton.layer.cornerRadius = 10
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
        registerButton.backgroundColor = Colors.Theme.inputColor
        registerButton.layer.cornerRadius = 10
        registerButton.layer.borderColor = Colors.Text.secondaryText?.cgColor
        registerButton.layer.borderWidth = 0.4
        registerButton.addTarget(self, action: #selector(didTapRegisterBtn), for: .touchUpInside)
    }
    
    private func configureSaveInfoView() {
        saveInfoContainerView.backgroundColor = Colors.Theme.mainColor
        rememberInfoLabel.text = "Remember Info"
        rememberInfoLabel.font = Fonts.subtitleFont
        rememberInfoLabel.textColor = Colors.Text.primaryText
        
        forgotPasswordLabel.text = "Forgot password?"
        forgotPasswordLabel.font = Fonts.subtitleFont
        forgotPasswordLabel.textColor = Colors.Text.primaryText
        
        rememberInfoFlagImageView.image = Images.rememberFalse
        
        rememberInfoFlagImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRemeberInfoView))
        rememberInfoFlagImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapRemeberInfoView() {
        presenter?.didTapRemeberInfoView()
    }
    
    @objc func didTapRegisterBtn() {
        presenter?.tappedRegisterBtn()
    }

}

extension Login: LoginViewDelegate {
    func updateRememberInfoFlag(flag: Bool) {
        rememberInfoFlagImageView.image = flag ? Images.rememberTrue : Images.rememberFalse
    }
    
    func updateLoginButtton(isCompleted: Bool) {
        print("IsCompleted is \(isCompleted)")
        loginButton.isUserInteractionEnabled = isCompleted
        loginButton.backgroundColor = isCompleted ? Colors.Button.primaryColor : Colors.Button.primaryColor?.withAlphaComponent(0.4)
    }
}


extension Login: PinViewDelegate {
    func didFinishedConfirmCode(isMatched: Bool) {
        print("IsMatched Flag => \(isMatched)")
    }
    func didFinishedEnterCode(password: String) {
        presenter?.didChangePassword(password: password)
    }
    
    func didTapDeleteButton() {
        presenter?.didTapDeletePassword()
    }
}


extension Login: PhoneNumberViewDelegate {
    func didChangePhoneNumber(phoneNum: String) {
        presenter?.didChangePhoneNumber(phoneNum: phoneNum)
    }
}
