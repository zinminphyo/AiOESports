//
//  InputTextFieldView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class InputTextFieldView: UIControl, NibLoadable {
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var inputTextField: UITextField!
    
    private var _title: String = ""
    @IBInspectable var title: String {
        set {
            titleLabel.text = newValue
            _title = newValue
        }
        get { _title }
    }
    
    private var _placeholder: String = ""
    @IBInspectable var placeholder: String {
        set {
            inputTextField.placeholder = newValue
            _placeholder = newValue
        }
        get { _placeholder }
    }
    
    private var _value: String? = nil
    @IBInspectable var value: String? {
        set {
            inputTextField.text = newValue
            _value = newValue
        }
        get { _value }
    }

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
        configureTextField()
    }
    
    private func configureTextField() {
        inputTextField.addTarget(self, action: #selector(didChangeInputText), for: .editingChanged)
    }
    
    @objc func didChangeInputText() {
        _value = inputTextField.text 
        sendActions(for: .valueChanged)
    }
    
}
