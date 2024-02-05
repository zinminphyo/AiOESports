//
//  ConfirmYourAccountViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/02/2024.
//

import Foundation
import Combine

class ConfirmYourAccountViewModel {
    
    private let service: ForgotStep1ServiceProtocol
    
    struct ConfirmYourAccount {
        let name: String
        let profileURL: String
        let badge: String
        let level: String
        let phoneNumber: String
    }
    
    let confirmAccountInfo: ConfirmYourAccount
    
    
    var didCompleteStep1: PassthroughSubject<Void, Never> = .init()
    
    init(confirmAccountInfo: ConfirmYourAccount) {
        self.confirmAccountInfo = confirmAccountInfo
        service = ForgotStep1Service()
    }
    
    
    func forgotStep1() {
        Task {
            do {
                try await service.step1Reset(phoneNumber: confirmAccountInfo.phoneNumber)
                didCompleteStep1.send()
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
}
