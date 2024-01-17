//
//  UserInfo.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/12/2023.
//


/*
 "id": 1026,
 "username": "Zin Min Phyo",
 "phone_no": "09757245240",
 "dob": "May 25 1998",
 "profile_image": "images/profileImages/1701019495.jpg",
 "shield": 0,
 "diamond": 0,
 "city": "Alone",
 "state": "Yangon",
 "gender": "male",
 "level": "free",
 "facebook_link": "12123123",
 "instagram_link": "1231231231",
 "otp": "317278",
 "verified": 1,
 "badge": "off",
 "created_at": "2023-11-18T03:51:36.000000Z",
 "updated_at": "2023-11-28T07:29:47.000000Z"
 */

import Foundation


struct UserInfo: Decodable {
    let id: Int
    let username: String
    let phone_no: String
    let dob: String
    let profile_image: String
    let shield: Int
    let diamond: Int
    let city: String
    let state: String
    let gender: String
    let level: String
    let facebook_link: String
    let instagram_link: String
    let otp: String
    let verified: Int
    let badge: String
    let created_at: String
    let updated_at: String
    
    enum CodingKeys: CodingKey {
        case id, username, phone_no, dob, profile_image, shield, diamond, city, state, gender, level, facebook_link, instagram_link, otp, verified, badge, created_at, updated_at
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        phone_no = try container.decode(String.self, forKey: .phone_no)
        dob = try container.decode(String?.self, forKey: .dob) ?? ""
        profile_image = try container.decode(String.self, forKey: .profile_image)
        shield = try container.decode(Int.self, forKey: .shield)
        diamond = try container.decode(Int.self, forKey: .diamond)
        city = try container.decode(String?.self, forKey: .city) ?? ""
        state = try container.decode(String?.self, forKey: .state) ?? ""
        gender = try container.decode(String?.self, forKey: .gender) ?? ""
        level = try container.decode(String?.self, forKey: .level) ?? ""
        facebook_link = try container.decode(String?.self, forKey: .facebook_link) ?? ""
        instagram_link = try container.decode(String?.self, forKey: .instagram_link) ?? ""
        otp = try container.decode(String.self, forKey: .otp)
        verified = try container.decode(Int.self, forKey: .verified)
        badge = try container.decode(String.self, forKey: .badge)
        created_at = try container.decode(String.self, forKey: .created_at)
        updated_at = try container.decode(String.self, forKey: .updated_at)
    }
}
