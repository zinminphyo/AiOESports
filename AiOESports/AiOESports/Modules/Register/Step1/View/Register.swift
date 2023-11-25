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
    @IBOutlet weak var enterPasscodeView: PasscodeView!
    @IBOutlet weak var reEnterPasscodeView: PasscodeView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var userNameErrorLabel: UILabel!
    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var enterPasswordErrorLabel: UILabel!
    @IBOutlet weak var reEnterPasswordErrorLabel: UILabel!
    
    var presenter: RegisterPresenter?
    private var cancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureKeyboardDismiss()
        configurePresenter()
        configureUserNameTxtField()
        configurePhoneNumberView()
        configurePasscodeView()
        configureLoginBtn()
        configureRegisterBtn()
    }
    
    private func configureKeyboardDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapKeyboardToDismiss(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapKeyboardToDismiss(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func configurePresenter() {
       
        presenter?.viewDidLoad()
        
        presenter?.$dataIsCompleted
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.registerBtn.isUserInteractionEnabled = $0
                self.registerBtn.backgroundColor = $0 ? Colors.Button.primaryColor : UIColor.tertiarySystemFill
                self.registerBtn.tintColor = $0 ? UIColor.white : UIColor.gray
            })
            .store(in: &cancellable)
        
        presenter?.passwordIsEqual
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.enterPasswordErrorLabel.isHidden = $0
                self.reEnterPasswordErrorLabel.isHidden = $0
            }).store(in: &cancellable)
        
    }
    
    private func configureUserNameTxtField() {
        let placeholder = "Enter username"
        let attributedPlaceholder = NSMutableAttributedString(string: placeholder)
        attributedPlaceholder.addAttribute(.foregroundColor, value: Colors.Text.secondaryText!, range: NSRange(location: 0, length: placeholder.count))
        usernameTxtField.attributedPlaceholder = attributedPlaceholder
        usernameTxtField.addTarget(self, action: #selector(didChangeUserName), for: .editingChanged)
        usernameTxtField.textColor = UIColor.white
    }
    
    private func configurePhoneNumberView() {
        phoneNumberView.delegate = self
    }
    
    private func configurePasscodeView() {
        enterPasscodeView.delegate = self
        reEnterPasscodeView.delegate = self
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
        self.presenter?.register()
    }
    
    @objc func didTapLoginBtn() {
        guard let vc = LoginModule.createModule() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didChangeUserName() {
        presenter?.set(username: usernameTxtField.text ?? "")
    }

}



// MARK: - Phone Number View Delegate
extension Register: PhoneNumberViewDelegate {
    func didChangePhoneNumber(phoneNum: String) {
        presenter?.set(phNum: phoneNum)
    }
}




// MARK: - Register View Delegate
extension Register: RegisterViewDelegate {
    
    func render(state: RegistrationViewRenderState) {
        /*
        print("State is \(state)")
        
        UIView.animate(withDuration: 0.2, delay: 0.0) { [weak self] in
            guard let self = self else { return }
            self.userNameErrorLabel.isHidden = !(state == .fieldRequiredFailure)
            self.phoneNumberErrorLabel.isHidden = !(state == .fieldRequiredFailure)
            self.enterPasswordErrorLabel.isHidden = state == .success || state == .apiFailure(error: "")
            self.reEnterPasswordErrorLabel.isHidden = state == .success || state == .apiFailure(error: "")
        }
        
        */
        
        
        
        userNameErrorLabel.text = state.errorString
        phoneNumberErrorLabel.text = state.errorString
        enterPasswordErrorLabel.text = state.errorString
        reEnterPasswordErrorLabel.text = state.errorString
        
        /*
        switch state {
        case .success:
            print("Success")
        case .fieldRequiredFailure:
            print("Field Required")
        case .apiFailure(let error):
            print("Api Error is \(error)")
        case .passwordNotMatch:
            print("Password didn't match.")
        }
         */
        
        switch state {
        case .success:
            let vc = RegisterStep2Controller(phoneNumber: "09757245240")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    
}


extension Register: PasscodeViewDelegate {
    func didFinishedEnterPasscode(in view: PasscodeView, _ passcode: String) {
        switch view {
        case enterPasscodeView:
            presenter?.set(enterPassword: passcode)
        case reEnterPasscodeView:
            presenter?.set(reEnterPassword: passcode)
        default:
            break
        }
    }
}
