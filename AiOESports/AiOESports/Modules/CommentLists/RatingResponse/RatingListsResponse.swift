//
//  RatingListsResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import Foundation



struct Rating: Decodable {
    let star: Int
    let comment: String
    let created_at: String
    let username: String
    let profile_image: String
    var profileImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + profile_image
    }
    let id: Int
    let level: String
    let badge: String
}

typealias RatingLists = [Rating]
