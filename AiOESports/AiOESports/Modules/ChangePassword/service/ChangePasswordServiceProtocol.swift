//
//  ChangePasswordServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation


protocol ChangePasswordServiceProtocol {
    func changePassword(
        currentPassword: String,
        newPassword: String
    ) async throws -> Bool
}
