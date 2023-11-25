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
    
    private(set) var registrationStatus = PassthroughSubject<RegistrationStatus, Never>()
    enum RegistrationStatus {
        case inProgress
        case completed
    }
    
    
    init(phNum: String) {
        phoneNumber = phNum
    }
    
    func registerStep2() {
        registrationStatus.send(.inProgress)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.registrationStatus.send(.completed)
        }
    }
    
}
