//
//  GetPinCodeService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import Foundation


protocol GetPinCodeServiceProtocol {
    func getPinCode(phoneNumber: String) async throws -> Bool
}
