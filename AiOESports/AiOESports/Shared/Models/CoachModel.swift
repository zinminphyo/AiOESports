//
//  Coach.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


struct CoachModel: Decodable {
    let id: Int
    let teamID, talent, name, status: String?
    let fullName, birthday, location, city: String?
    let bio, game, role, playerImage: String?
    let coverImage, sortNo, visable: String?
    let createdAt: String
    let updatedAt: String
    
    var playerImageFullURL: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (playerImage ?? "")
    }
    
    var coverImageFullURL: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (coverImage ?? "")
    }
    
    var countryImageFullURL: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (location ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case teamID = "team_id"
        case talent, name, status
        case fullName = "full_name"
        case birthday, location, city, bio, game, role
        case playerImage = "player_image"
        case coverImage = "cover_image"
        case sortNo = "sort_no"
        case visable
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
