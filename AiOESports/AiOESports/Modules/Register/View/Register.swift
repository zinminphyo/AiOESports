//
//  Register.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import UIKit
import Combine

class Register: UIViewController {
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var phoneNumberView: PhoneNumberView!
    @IBOutlet weak var enterPinView: PinView!
    @IBOutlet weak var reEnterPinView: PinView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    var presenter: RegisterPresenter?
    private var cancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configurePresenter()
        configureUserNameTxtField()
        configurePhoneNumberView()
        configureEnterPinView()
        configureReEnterPinView()
        configureLoginBtn()
        configureRegisterBtn()
    }
    
    private func configurePresenter() {
        presenter?.passwordEqualityFlag
            .sink(receiveValue: { [weak self] flag in
                guard let self = self else { return }
                self.registerBtn.backgroundColor = flag ? Colors.Button.primaryColor : Colors.Button.secondaryColor
                self.registerBtn.isUserInteractionEnabled = flag
            })
            .store(in: &cancellable)
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
        enterPinView.state = .enter
        enterPinView.delegate = self
    }
    
    private func configureReEnterPinView() {
        reEnterPinView.state = .enter
        reEnterPinView.delegate = self
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
        if let userName = usernameTxtField.text {
            self.presenter?.register(userName: userName)
        } else  {
            // To reder error
        }
        
        
    }
    
    @objc func didTapLoginBtn() {
        guard let vc = LoginModule.createModule() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}



// MARK: - Phone Number View Delegate
extension Register: PhoneNumberViewDelegate {
    func didChangePhoneNumber(phoneNum: String) {
        presenter?.set(phNum: phoneNum)
    }
}




// MARK: - PinViewDelegate
extension Register: PinViewDelegate {
    func didFinishedConfirmCode(pinView: PinView, isMatched: Bool) {
        
    }
    
    func didFinishedEnterCode(pinView: PinView, password: String) {
        if pinView == enterPinView {
            presenter?.set(enterPassword: password)
        } else {
            presenter?.set(reEnterPassword: password)
        }
    }
    
    func didTapDeleteButton(pinView: PinView) {
        
    }
}


// MARK: - Register View Delegate
extension Register: RegisterViewDelegate {
    
}
