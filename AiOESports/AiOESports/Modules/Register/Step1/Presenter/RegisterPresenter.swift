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
    
    private let step1RegistrationService = Step1RegistrationService()
    
    // MARK: -  User Properties
    private var enterPassword: String = ""
    private var reEnterPassword: String = ""
    private(set) var phoneNumber: String = ""
    private var userName: String = ""
    
    @Published
    var isRegistering: Bool = false
    
    var passwordIsEqual = PassthroughSubject<Bool, Never>()
    
    @Published
    var dataIsCompleted: Bool = false
    
    var step1RegistrationCompleted = PassthroughSubject<Void, Never>()
    
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
        
//        interactor?.registerStep1(userName: userName, phNum: phoneNumber, password: enterPassword)
         
//        viewDelegate?.render(state: .success)
        isRegistering = true
        Task {
            do {
                let response = try await step1RegistrationService.register(username: userName, phonenum: phoneNumber, password: enterPassword)
                guard response.result?.user != nil else { return }
                step1RegistrationCompleted.send()
            } catch {
                print("Error in registration is \(error.localizedDescription)")
            }
            isRegistering = false
        }
    }
    
    func didFinishedStep1Registration(responseModel: RegisterResponseModel?, error: String?) {
        if let responseModel = responseModel {
            step1RegistrationCompleted.send()
        } else if let error = error {
            print("Error is \(error)")
        }
    }
}
