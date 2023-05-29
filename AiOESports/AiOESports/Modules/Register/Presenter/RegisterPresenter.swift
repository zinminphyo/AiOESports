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
    
    private var enterPassword: String = ""
    private var reEnterPassword: String = ""
    private var phoneNumber: String = ""
    
    var passwordEqualityFlag: CurrentValueSubject<Bool, Never> = CurrentValueSubject(false)
    
    private var cancellable = Set<AnyCancellable>()
    
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
    
    private func checkPasswordIsEqual() {
        passwordEqualityFlag.send(self.enterPassword == self.reEnterPassword)
    }
    
    func viewDidLoad() {
        passwordEqualityFlag
            .sink { [weak self] flag in
                guard let self = self else { return }
                guard flag == false else { return }
                self.viewDelegate?.render(state: .passwordNotMatch)
            }
            .store(in: &cancellable)
    }
    
    func register(userName: String) {
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
