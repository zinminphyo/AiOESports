//
//  UpdateResponseModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation


/*
 "id": 1026,
         "username": "Zin Min Phyo",
         "phone_no": "09757245240",
         "dob": "25 May 1999",
         "profile_image": "images/profileImages/1701012797.jpg",
         "shield": 0,
         "diamond": 0,
         "city": "Sanchaung",
         "state": "Yangon",
         "gender": "male",
         "level": "free",
         "facebook_link": "12123123",
         "instagram_link": "1231231231",
         "otp": "386441",
         "verified": 1,
         "badge": "off",
         "created_at": "2023-11-18T03:51:36.000000Z",
         "updated_at": "2023-11-26T15:33:17.000000Z"
 */


struct UpdateResponseModel: Decodable {
    let username: String
    let phone_no: String
    let dob: String
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
    let verified: Int
    let badge: String
    let created_at: String
    let updated_at: String
}
