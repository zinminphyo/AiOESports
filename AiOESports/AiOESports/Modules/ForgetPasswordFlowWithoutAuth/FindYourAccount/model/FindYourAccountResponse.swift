//
//  FindYourAccountResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/02/2024.
//

import Foundation


struct FindYourAccountResponse: Decodable {
    let profile_image: String
    var profileImage_FullURL: String {
        "\(NetworkBaseURLs.shared.baseURL)/\(profile_image)"
    }
    let username: String
    let level: String
    let badge: String
}
