//
//  Register.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import UIKit

class Register: UIViewController {
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var phoneNumberView: PhoneNumberView!
    @IBOutlet weak var enterPinView: PinView!
    @IBOutlet weak var reEnterPinView: PinView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureUserNameTxtField()
        configurePhoneNumberView()
        configureEnterPinView()
        configureReEnterPinView()
        configureLoginBtn()
        configureRegisterBtn()
    }
    
    private func configureUserNameTxtField() {
        let placeholder = "Enter username"
        let attributedPlaceholder = NSMutableAttributedString(string: placeholder)
        attributedPlaceholder.addAttribute(.foregroundColor, value: Colors.Text.secondaryText!, range: NSRange(location: 0, length: placeholder.count))
        usernameTxtField.attributedPlaceholder = attributedPlaceholder
    }
    
    private func configurePhoneNumberView() {
        phoneNumberView.delegate = self
    }
    
    private func configureEnterPinView() {
        
    }
    
    private func configureReEnterPinView() {
        
    }
    
    private func configureRegisterBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Register"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            registerBtn.configuration = configuration
        } else {
            registerBtn.setTitle("Register", for: .normal)
            registerBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            registerBtn.titleLabel?.font = Fonts.subtitleFont
        }
        registerBtn.backgroundColor = Colors.Button.primaryColor
        registerBtn.addTarget(self, action: #selector(didTapRegisterBtn), for: .touchUpInside)
        registerBtn.layer.cornerRadius = 10
    }
    
    private func configureLoginBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Log in"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            loginBtn.configuration = configuration
        } else {
            loginBtn.setTitle("Log in", for: .normal)
            loginBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
            loginBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        loginBtn.backgroundColor = Colors.Theme.inputColor
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.borderColor = Colors.Text.primaryText?.cgColor
        loginBtn.layer.borderWidth = 0.4
        loginBtn.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
    }
    
    @objc func didTapRegisterBtn() {
        
        
    }
    
    @objc func didTapLoginBtn() {
        guard let vc = LoginModule.createModule() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension Register: PhoneNumberViewDelegate {
    func didChangePhoneNumber(phoneNum: String) {
        
    }
}

extension Register: PinViewDelegate {
    func didFinishedConfirmCode(isMatched: Bool) {
        
    }
    
    func didFinishedEnterCode(password: String) {
        
    }
    
    func didTapDeleteButton() {
        
    }
}
