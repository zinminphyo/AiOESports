//
//  FindYourAccountServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/02/2024.
//

import Foundation


protocol FindYourAccountServiceProtocol {
    func search(_ phoneNumber: String) async throws -> FindYourAccountResponse?
}
