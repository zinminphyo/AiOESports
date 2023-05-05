//
//  DatePicker.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/05/2023.
//

import UIKit

class DatePicker: UIView, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate? = nil
    
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
        configureBackgroundView()
        configureTitleLabel()
        configureSetButton()
        configureClearButton()
        configureDatePicker()
    }
    
    private func configureBackgroundView() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Choose date of birth"
        titleLabel.font = Fonts.titleFont
        titleLabel.textColor = Colors.Text.primaryText
    }
    
    
    private func configureClearButton() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Clear"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            clearBtn.configuration = configuration
        } else {
            clearBtn.setTitle("Clear", for: .normal)
            clearBtn.titleLabel?.font = Fonts.subtitleFont
            clearBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        clearBtn.backgroundColor = Colors.Theme.inputColor
        clearBtn.layer.cornerRadius = 10
        clearBtn.layer.borderColor = Colors.Text.primaryText?.cgColor
        clearBtn.layer.borderWidth = 0.4
        clearBtn.addTarget(self, action: #selector(didTapClearBtn), for: .touchUpInside)
    }
    
    private func configureSetButton() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Set"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = Fonts.subtitleFont
                outgoing.foregroundColor = Colors.Text.primaryText
                return outgoing
            }
            setBtn.configuration = configuration
        } else {
            setBtn.setTitle("Set", for: .normal)
            setBtn.titleLabel?.font = Fonts.subtitleFont
            setBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        setBtn.backgroundColor = Colors.Button.primaryColor
        setBtn.layer.cornerRadius = 10
        setBtn.layer.borderColor = Colors.Text.primaryText?.cgColor
        setBtn.layer.borderWidth = 0.4
        setBtn.addTarget(self, action: #selector(didTapSetBtn), for: .touchUpInside)
    }
    
    private func configureDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.setValue(Colors.Text.primaryText ?? UIColor.white, forKey: "textColor")
    }
    
    @objc func didTapClearBtn() {
        self.delegate?.didTapCancel()
    }
    
    @objc func didTapSetBtn() {
        self.delegate?.didTapSet(date: datePicker.date)
    }
}


