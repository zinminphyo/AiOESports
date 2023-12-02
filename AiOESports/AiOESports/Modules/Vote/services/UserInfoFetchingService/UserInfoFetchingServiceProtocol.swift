//
//  UserInfoFetchingServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/12/2023.
//

import Foundation

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

protocol UserInfoFetchingServiceProtocol {
    func fetchUserInfo() async throws -> UserInfo
}

enum UserInfoFetchingError: Error {
    case empty
}
