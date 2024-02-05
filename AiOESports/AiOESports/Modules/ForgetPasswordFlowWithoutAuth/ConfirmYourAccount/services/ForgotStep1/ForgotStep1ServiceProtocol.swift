//
//  ForgotStep1ServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/02/2024.
//

import Foundation


protocol ForgotStep1ServiceProtocol {
    func step1Reset(phoneNumber: String) async throws
}
