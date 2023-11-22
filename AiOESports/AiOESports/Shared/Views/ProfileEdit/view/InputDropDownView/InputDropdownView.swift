//
//  InputDropdownView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class InputDropdownView: UIView, NibLoadable {
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var infoLabel: UILabel!
    
    private var _title: String = ""
    @IBInspectable var title: String {
        set {
            titleLabel.text = newValue
            _title = newValue
        }
        get { _title }
    }
    
    private var _dropdownInfo: String = ""
    @IBInspectable var dropdownInfo: String {
        set {
            infoLabel.text = newValue
            _dropdownInfo = newValue
        }
        get { _dropdownInfo }
    }
    
    var customInputView: UIView?
    
    override var inputView: UIView? {
        return customInputView
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }
    
    @IBAction
    private func didTapDropdown(_ sender: UIButton) {
        becomeFirstResponder()
    }

}


extension InputDropdownView: UIKeyInput {
    var hasText: Bool {
        return true
    }
    
    func insertText(_ text: String) {}
    
    func deleteBackward() {}
}



