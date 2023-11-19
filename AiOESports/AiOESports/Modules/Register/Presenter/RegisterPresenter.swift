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
    
    
    var passwordIsEqualSubject = PassthroughSubject<Bool, Never>()
    
    // MARK: - Combine Flag
    var passwordEqualityFlag: CurrentValueSubject<Bool, Never> = CurrentValueSubject(true)
    var fieldAllCompletedFlag: CurrentValueSubject<Bool, Never> = CurrentValueSubject(true)
    
    private var cancellable = Set<AnyCancellable>()
    
    
    // MARK: - Setters
    func set(enterPassword: String) {
        self.enterPassword = enterPassword
        checkPasswordIsEqual()
    }
    
    func set(reEnterPassword: String) {
        self.reEnterPassword = reEnterPassword
        checkPasswordIsEqual()
    }
    
    func set(phNum: String) {
        self.phoneNumber = phNum
    }
    
    func set(username: String) {
        self.userName = username
    }
    
    // MARK: - Helper Functions
    private func checkPasswordIsEqual() {
//        passwordEqualityFlag.send(self.enterPassword == self.reEnterPassword)
        passwordIsEqualSubject.send(enterPassword == reEnterPassword)
    }
    
    private func checkAllFieldCompleted() {
        fieldAllCompletedFlag.value = userName.isEmpty == false && passwordEqualityFlag.value == true && phoneNumber.isEmpty == false
    }
    
    
    // MARK: - Protocol Conformance
    func viewDidLoad() {
        passwordEqualityFlag
            .sink { [weak self] flag in
                guard let self = self else { return }
                flag ? self.checkAllFieldCompleted() : self.viewDelegate?.render(state: .passwordNotMatch)
            }
            .store(in: &cancellable)
        
        passwordIsEqualSubject
            .sink { [weak self] in
                guard let self = self else { return }
                $0 ? self.viewDelegate?.render(state: .success) : self.viewDelegate?.render(state: .passwordNotMatch)
            }.store(in: &cancellable)
        
        fieldAllCompletedFlag
            .sink { [weak self] flag in
                guard let self = self  else { return }
                flag ? self.interactor?.registerStep1(userName: self.userName, phNum: self.phoneNumber, password: self.enterPassword) : self.viewDelegate?.render(state: .fieldRequiredFailure)
            }
            .store(in: &cancellable)
    }
    
    func register() {
        checkAllFieldCompleted()
    }
    
    func didFinishedStep1Registration(responseModel: RegisterResponseModel?, error: String?) {
        if let responseModel = responseModel {
            print("Response Model is \(responseModel)")
        } else if let error = error {
            print("Error is \(error)")
        }
    }
}
