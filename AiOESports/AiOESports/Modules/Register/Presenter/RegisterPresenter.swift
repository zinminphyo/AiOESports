//
//  RegisterPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation
import Combine

class RegisterPresenter: RegisterPresenting {
    
    var viewDelegate: RegisterViewDelegate?
    var interactor: RegisterInteracting?
    
    // MARK: -  User Properties
    private var enterPassword: String = ""
    private var reEnterPassword: String = ""
    private var phoneNumber: String = ""
    private var userName: String = ""
    
    
    var passwordIsEqual = PassthroughSubject<Bool, Never>()
    
    @Published
    var dataIsCompleted: Bool = false
    
    
    
    // MARK: - Setters
    func set(enterPassword: String) {
        self.enterPassword = enterPassword
        checkAllFieldCompleted()
        checkPasswordIsEqual()
    }
    
    func set(reEnterPassword: String) {
        self.reEnterPassword = reEnterPassword
        checkAllFieldCompleted()
        checkPasswordIsEqual()
    }
    
    func set(phNum: String) {
        self.phoneNumber = phNum
        checkAllFieldCompleted()
    }
    
    func set(username: String) {
        self.userName = username
        checkAllFieldCompleted()
    }
    
    // MARK: - Helper Functions
    private func checkPasswordIsEqual() {
        passwordIsEqual.send(enterPassword == reEnterPassword)
    }
    
    private func checkAllFieldCompleted() {
        let isCompleted = !userName.isEmpty && !enterPassword.isEmpty && !reEnterPassword.isEmpty && !phoneNumber.isEmpty
        dataIsCompleted = isCompleted
    }
    
    
    // MARK: - Protocol Conformance
    func viewDidLoad() {}
    
    func register() {
        interactor?.registerStep1(userName: userName, phNum: phoneNumber, password: enterPassword)
    }
    
    func didFinishedStep1Registration(responseModel: RegisterResponseModel?, error: String?) {
        if let responseModel = responseModel {
            print("Response Model is \(responseModel)")
        } else if let error = error {
            print("Error is \(error)")
        }
    }
}
