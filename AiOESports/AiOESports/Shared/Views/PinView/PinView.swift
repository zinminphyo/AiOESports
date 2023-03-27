//
//  PinView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import UIKit

class PinView: UIView, NibLoadable {
    
    enum PinViewDigitStyle {
        case fourDigits
        case sixDigits
    }
    
    enum PinViewConfirmState {
        case intial
        case confirm
        case enter
    }
    
    private var containerViews: [UIView] = []
    private var contentViews: [UITextField] = []
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    var digitStyle: PinViewDigitStyle = .sixDigits
    var state: PinViewConfirmState = .intial
    var delegate: PinViewDelegate? = nil
    
    private(set) var passcode: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureStackView()
        configurePinViews()
    }
    
    private func configureStackView() {
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    }
    
    private func configurePinViews() {
        switch digitStyle {
        case .fourDigits:
            configureForFourDigits()
        case .sixDigits:
            configureForSixDigits()
        }
    }
    
    private func configureForFourDigits() {
        containerViews.removeAll()
        contentViews.removeAll()
        let iRange = 0..<4
        for _ in iRange {
            constructView()
        }
    }
    
    private func configureForSixDigits() {
        containerViews.removeAll()
        contentViews.removeAll()
        let iRange = 0..<6
        for _ in iRange {
            constructView()
        }
    }
    
    private func constructView() {
        let view = UIView()
        view.backgroundColor = Colors.Theme.inputColor
        view.layer.cornerRadius = 5
        let txtField = PinTextField()
        txtField.isSecureTextEntry = true
        txtField.deleteDelegate = self
        txtField.keyboardType = .numberPad
        txtField.textAlignment = .center
        txtField.tintColor = Colors.Text.primaryText
        txtField.textColor = Colors.Text.primaryText
        view.addSubview(txtField)
        txtField.addTarget(self, action: #selector(didChangedDigit), for: .editingChanged)
        txtField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            txtField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            txtField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            txtField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            txtField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        containerViews.append(view)
        contentViews.append(txtField)
        stackView.addArrangedSubview(view)
    }
    
    
    @objc func didChangedDigit(txtField: UITextField) {
        guard txtField.text?.isEmpty == false else { return }
        guard let index = contentViews.firstIndex(of: txtField) else { return }
        passcodeStateHandle()
        guard index < contentViews.count - 1 else {
            txtField.resignFirstResponder()
            return
        }
        contentViews[index + 1].becomeFirstResponder()
    }
    
    private func passcodeStateHandle() {
        switch state {
        case .intial:
            saveInitialPIN()
            resetTxtFields()
        case .confirm:
            checkConfirmPIN()
        case .enter:
            print("Check with enter passcode.")
        }
    }
    
    private func saveInitialPIN() {
        passcode = ""
        contentViews.forEach{
            passcode += $0.text ?? ""
        }
    }
    
    private func resetTxtFields() {
        switch digitStyle {
        case .fourDigits:
            guard passcode.count == 4 else { return }
        case .sixDigits:
            guard passcode.count == 6 else { return }
        }
        contentViews.forEach{
            $0.text = ""
        }
        contentViews.first?.becomeFirstResponder()
        state = .confirm
    }
    
    private func checkConfirmPIN() {
        var confirmPIN: String = ""
        contentViews.forEach {
            confirmPIN += $0.text ?? ""
        }
        if confirmPIN == passcode {
            self.delegate?.didFinishedConfirmCode(isMatched: true)
        } else {
            self.delegate?.didFinishedConfirmCode(isMatched: false)
        }
    }

}

// MARK: - PinTextField Custom Delegate.
extension PinView: PinTextFieldDelegate {
    func didTapDeleteBackward(txtField: UITextField) {
        guard let index = contentViews.firstIndex(of: txtField) else { return }
        guard index > 0 else {
            txtField.resignFirstResponder()
            return
        }
        contentViews[index - 1].becomeFirstResponder()
    }
}
