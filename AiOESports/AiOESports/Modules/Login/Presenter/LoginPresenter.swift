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
    
    var interactor: LoginInteracting?
    
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
    
    
    func tappedLoginBtn() {
        self.viewDelegate?.showLoading()
        self.interactor?.login(phoneNum: "0\(phoneNumber)", password: password)
    }
    
    func tappedForgetLabel() {
        self.router?.routeToForgetPasswordModule()
    }
    
    func didTapDeletePassword() {
        if password.isEmpty == false {
            self.password.removeLast()
        }
    }
    
    func didFinishedLogin(user: UserModel?, error: String?) {
        if let user = user {
            self.viewDelegate?.hideLoaing()
            self.router?.routeToInAppModule()
            self.viewDelegate?.updateLoginViewState(isCorrect: true)
        } else if let error = error {
            print("Error is \(error)")
            self.viewDelegate?.hideLoaing()
            self.viewDelegate?.updateLoginViewState(isCorrect: false)
        }
    }
    
    private func checkRequiredInfoIsCompleted() {
        let isCompleted = phoneNumber.isEmpty == false && password.count == PinView.PinViewDigitStyle.sixDigits.passcodeCount && isRemebered
        self.viewDelegate?.updateLoginButtton(isCompleted: isCompleted)
    }
    
    
    
}
