//
//  VerifyPhoneNumberViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Combine

class VerifyPhoneNumberViewModel {
    
    let phoneNumber: String
    let userId: String
    private let service = VerifyPhoneNumberService()
    
    private var pinCode: String = ""
    
    @Published
    var isFetching: Bool = false
    
    @Published
    var verifyIsEnabled: Bool = false
    
    var isVerifyPINCompleted = PassthroughSubject<Void, Never>()
    
    init(phoneNum: String, userID: String) {
        phoneNumber = phoneNum
        userId = userID
    }
    
    func verifyPIN() {
        isFetching = true
        Task {
            do {
                let response = try await service.verify(phoneNum: phoneNumber, otp: pinCode)
                print("Response is \(response)")
                guard response else { return }
                isVerifyPINCompleted.send()
            } catch {
                print("Error in verify phone number is \(error.localizedDescription)")
            }
            isFetching = false
        }
    }
    
    func set(pincode: String) {
        pinCode = pincode
        verifyIsEnabled = pinCode.count == 6
    }
}
