//
//  RegisterStep2ViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation
import Combine

class RegisterStep2ViewModel {
    
    let phoneNumber: String
    
    private var pincode: String = ""
    
    private(set) var registrationStatus = PassthroughSubject<RegistrationStatus, Never>()
    enum RegistrationStatus {
        case inProgress
        case completed
    }
    
    private let service = Step2RegistrationService()
    
    init(phNum: String) {
        phoneNumber = phNum
    }
    
    func registerStep2() {
        registrationStatus.send(.inProgress)
        Task {
            do {
                let response = try await service.verify(pinCode: pincode, phoneNum: phoneNumber)
                guard let result = response.result else { return }
                UserDataModel.shared.saveToken(token: result.token)
            } catch {
                print("Error in step2 registration is \(error.localizedDescription)")
            }
            registrationStatus.send(.completed)
        }
    }
    
    func set(pincode: String) {
        self.pincode = pincode
    }
    
}
