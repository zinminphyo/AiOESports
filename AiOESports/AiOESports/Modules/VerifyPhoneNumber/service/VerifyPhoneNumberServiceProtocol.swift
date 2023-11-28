//
//  VerifyPhoneNumberServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation


protocol VerifyPhoneNumberServiceProtocol {
    func verify(
        phoneNum: String,
        otp: String
    ) async throws -> Bool
}
