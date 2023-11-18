//
//  PasscodeView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/11/2023.
//

import UIKit

class PasscodeView: UIView, UITextInputTraits {
    
    private var views: [SinglePasscodeView] = []
    private let stackView: UIStackView = UIStackView()
    
    override var canBecomeFirstResponder: Bool {
        true
    }
    
    var keyboardType: UIKeyboardType = .numberPad
    
    var passcode: String = "" {
        didSet {
            handlePasscodeInput()
        }
    }
    var maxCount: Int = 6

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        backgroundColor = UIColor.clear
        configureStackView()
        configureSubViews()
    }
    
    
    
    private func configureSubViews() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: bounds.height)
        let subViews = (0..<maxCount).compactMap{ _ in
            let view = SinglePasscodeView(frame: frame)
            view.isActive = false
            view.delegate = self
            return view
        }
        subViews.forEach {
            views.append($0)
            stackView.addArrangedSubview($0)
        }
    }

    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    private func handlePasscodeInput() {
        guard passcode.count <= maxCount else { return }
        
        for index in (0..<maxCount) {
            views[index].set(text: "")
        }
        for (index, inputCode) in passcode.enumerated() {
            views[index].set(text: String(inputCode))
        }
        
    }
    
}


extension PasscodeView: UIKeyInput {
    var hasText: Bool {
        return true
    }
    
    func insertText(_ text: String) {
        passcode.append(text)
        if passcode.count == maxCount {
            resignFirstResponder()
        }
    }
    
    func deleteBackward() {
        guard !passcode.isEmpty else { return }
        passcode.removeLast()
    }
    
    
}



extension PasscodeView: SinglePasscodeViewDelegate {
    func didTriggerTextInput(in view: SinglePasscodeView) {
        becomeFirstResponder()
    }
}
