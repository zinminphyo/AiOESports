//
//  Step2RegistrationServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation


protocol Step2RegistrationServiceProtocol {
    func verify(pinCode: String, phoneNum: String) async throws -> RegistrationVerifyResponse
}


