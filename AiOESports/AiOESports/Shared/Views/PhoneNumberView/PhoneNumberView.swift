//
//  PhoneNumberView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import UIKit

class PhoneNumberView: UIView, NibLoadable {
    
    @IBOutlet weak var countryCodeContainerView: UIView!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var countryCodeImageView: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!

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
        configureContainerView()
        configureCountyCodeView()
        configurePhoneNumberView()
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureCountyCodeView() {
        countryCodeContainerView.backgroundColor = Colors.Theme.inputColor
        countryCodeContainerView.layer.cornerRadius = 10
        countryCodeLabel.font = Fonts.subtitleFont
        countryCodeLabel.textColor = Colors.Text.primaryText
        countryCodeImageView.image = Images.countryImage
        countryCodeLabel.text = "+95"
    }
    
    private func configurePhoneNumberView() {
        phoneNumberView.backgroundColor = Colors.Theme.inputColor
        phoneNumberTxtField.backgroundColor = Colors.Theme.inputColor
        phoneNumberTxtField.textColor = Colors.Text.primaryText
        phoneNumberTxtField.borderStyle = .none
        phoneNumberTxtField.keyboardType = .numberPad
        phoneNumberView.layer.cornerRadius = 10
    }
    
}
