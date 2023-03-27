//
//  PinTextField.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import UIKit

class PinTextField: UITextField {

    var deleteDelegate: PinTextFieldDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        deleteDelegate?.didTapDeleteBackward(txtField: self)
    }

}


protocol PinTextFieldDelegate {
    func didTapDeleteBackward(txtField: UITextField)
}
