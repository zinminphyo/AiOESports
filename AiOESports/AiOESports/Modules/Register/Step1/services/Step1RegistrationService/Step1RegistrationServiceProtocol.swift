//
//  Step1RegistrationService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/12/2023.
//

import Foundation


protocol Step1RegistrationServiceProtocol {
    func register(username: String, phonenum: String, password: String) async throws -> BaseResponseModel<RegistrationResponseModel>
}
