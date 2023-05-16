//
//  UserModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/05/2023.
//

import Foundation



struct UserModel: Decodable {
    let id: Int
    let name: String
    let phoneNum: String
    let dob: String?
    let image: String
    let shield: Int
    let diamond: Int
    let city: String?
    let state: String?
    let gender: String?
    let level: String
    let otp: String
    let verified: Int
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, dob, shield, diamond, city, state, gender, level, otp, verified
        case name = "username"
        case phoneNum = "phone_no"
        case image = "profile_image"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
