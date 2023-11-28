//
//  ForgotPasswordViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Combine

class ForgotPasswordViewModel {
    
    private let service = GetPinCodeService()
    
    
    @Published
    var isFetching: Bool = false
    var pinCodeServiceCompleted = PassthroughSubject<Void, Never>()
    
    var profileModel: UserProfileResponseModel = .init()
    
    
    init(profile: UserProfileResponseModel) {
        profileModel = profile
    }
    
    func requestPinCode() {
        isFetching = true
        Task {
            do {
                let isSucceed = try await service.getPinCode(phoneNumber: profileModel.phone_no)
                if isSucceed {
                    pinCodeServiceCompleted.send()
                } else {
                    print("Something went wrong")
                }
            } catch {
                print("Error in reset password is \(error.localizedDescription)")
            }
            isFetching = false
        }
    }
    
}
