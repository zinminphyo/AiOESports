//
//  RegistrationResponseUserModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/12/2023.
//

import Foundation


struct RegistrationResponseUserModel: Decodable {
    let id: Int
    let username: String
    let phone_no: String
    let dob: String?
    let profile_image: String
    let shield: Int
    let diamond: Int
    let city: String?
    let state: String?
    let gender: String?
    let level: String
    let facebook_link: String?
    let instagram_link: String?
    let otp: String
    let verified: String
    let badge: String
    let created_at: String
    let updated_at: String
}


struct FinalRegistrationResponse: Decodable {
    let user: RegistrationResponseUserModel
    let token: String
}
