//
//  RegistrationUserModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/12/2023.
//

import Foundation


struct RegistrationUserModel: Decodable {
    let username: String
    let phone_no: String
    let profile_image: String
    let level: String
    let shield: Int
    let diamond: Int
    let verified: String
    let otp: String
    let updated_at: String
    let created_at: String
    let id: Int
}
