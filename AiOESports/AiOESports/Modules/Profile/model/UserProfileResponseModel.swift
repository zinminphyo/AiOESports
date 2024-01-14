//
//  UserProfileResponseModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation


/*
 {
     "result": {
         "id": 1026,
         "username": "Zin Min Phyo",
         "phone_no": "09757245240",
         "dob": "25 May 1999",
         "profile_image": "images/profileImages/1700280137.jpg",
         "shield": 0,
         "diamond": 0,
         "city": "Sanchaung",
         "state": "Yangon",
         "gender": "male",
         "level": "free",
         "facebook_link": null,
         "instagram_link": null,
         "otp": "386441",
         "verified": 1,
         "badge": "off",
         "created_at": "2023-11-18T03:51:36.000000Z",
         "updated_at": "2023-11-18T16:52:06.000000Z"
     },
     "statusCode": 200,
     "message": "Success"
 }
 */

struct UserProfileResponseModel: Decodable {
    
    private var numberFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumIntegerDigits = 9
        formatter.groupingSeparator = "-"
        return formatter
    }()
    
    let id: Int
    var formattedId: String {
        return numberFormatter.string(from: id as NSNumber) ?? ""
    }
    let username: String
    let phone_no: String
    let dob: String
    let profile_image: String
    let shield: Int
    let diamond: Int
    let city: String
    let state: String
    let gender: String
    var level: String
    let facebook_link: String?
    let instagram_link: String?
    let otp: String
    let verified: Int
    let badge: String
    let created_at: String
    let updated_at: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, phone_no, dob, profile_image, shield, diamond, city, state, gender, level, facebook_link, instagram_link, otp, verified, badge, created_at, updated_at
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        phone_no = try container.decode(String.self, forKey: .phone_no)
        dob = try container.decode(String?.self, forKey: .dob) ?? ""
        profile_image = try container.decode(String?.self, forKey: .profile_image) ?? ""
        shield = try container.decode(Int?.self, forKey: .shield) ?? 0
        diamond = try container.decode(Int?.self, forKey: .diamond) ?? 0
        city = try container.decode(String?.self, forKey: .city) ?? ""
        state = try container.decode(String?.self, forKey: .state) ?? ""
        gender = try container.decode(String?.self, forKey: .gender) ?? ""
        level = try container.decode(String?.self, forKey: .level) ?? ""
        facebook_link = try container.decode(String?.self, forKey: .facebook_link) ?? ""
        instagram_link = try container.decode(String?.self, forKey: .instagram_link) ?? ""
        otp = try container.decode(String?.self, forKey: .otp) ?? ""
        verified = try container.decode(Int?.self, forKey: .verified) ?? 0
        badge = try container.decode(String?.self, forKey: .badge) ?? ""
        created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        updated_at = try container.decode(String?.self, forKey: .updated_at) ?? ""
    }
    
    init() {
        id = 0
        username = ""
        phone_no = ""
        dob = ""
        profile_image = ""
        shield = 0
        diamond = 0
        city = ""
        state = ""
        gender = ""
        level = ""
        facebook_link = nil
        instagram_link = nil
        otp = ""
        verified = 0
        badge = ""
        created_at = ""
        updated_at = ""
    }
}




