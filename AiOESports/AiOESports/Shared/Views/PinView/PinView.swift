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
    
    private var containerViews: [UIView] = []
    private var contentViews: [UITextField] = []
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    var digitStyle: PinViewDigitStyle = .sixDigits

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
        let txtField = UITextField()
        txtField.isSecureTextEntry = true
        txtField.keyboardType = .numberPad
        view.addSubview(txtField)
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
    
    
    

}
