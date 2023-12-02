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
}
