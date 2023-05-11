//
//  LoginPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation
import Combine

class LoginPresenter: LoginPresenting {
    
    var viewDelegate: LoginViewDelegate?
    
    var router: LoginRouting?
    
    private var isRemebered: Bool = false {
        didSet {
            checkRequiredInfoIsCompleted()
        }
    }
    
    private var phoneNumber: String = "" {
        didSet {
            checkRequiredInfoIsCompleted()
        }
    }
    private var password: String = "" {
        didSet {
            checkRequiredInfoIsCompleted()
        }
    }

    
    func didTapRemeberInfoView() {
        isRemebered = !isRemebered
        self.viewDelegate?.updateRememberInfoFlag(flag: isRemebered)
    }
    
    func didChangePhoneNumber(phoneNum: String) {
        self.phoneNumber = phoneNum
    }
    
    func didChangePassword(password: String) {
        self.password = password
    }
    
    func tappedRegisterBtn() {
        self.router?.routeToRegisterModule()
    }
    
    func didTapDeletePassword() {
        if password.isEmpty == false {
            self.password.removeLast()
        }
    }
    
    private func checkRequiredInfoIsCompleted() {
        let isCompleted = phoneNumber.isEmpty == false && password.count == PinView.PinViewDigitStyle.sixDigits.passcodeCount && isRemebered
        self.viewDelegate?.updateLoginButtton(isCompleted: isCompleted)
    }
    
}
