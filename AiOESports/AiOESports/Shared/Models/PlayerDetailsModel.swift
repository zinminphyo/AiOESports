//
//  PlayerDetailsModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


struct PlayerDetailsModel: Decodable {
    let id: Int
    let teamId: String
    let talent: String
    let name: String
    let status: String
    let fullName: String
    let birthday: String
    let location: String
    let city: String
    let bio: String
    let game: String
    let role: String
    let playerImage: String
    let coverImage: String
    let teamName: String
    let teamImage: String
    
    var playerImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + playerImage
    }
    
    var coverImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + coverImage
    }
    
    var teamImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + teamImage
    }
    
    var locationImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + location
    }
    
    enum CodingKeys: String, CodingKey {
        case id, talent, name, status, birthday, location, city, bio, role, game
        case teamId = "team_id"
        case fullName = "full_name"
        case playerImge = "player_image"
        case coverImage = "cover_image"
        case teamName = "team_name"
        case teamImage = "team_image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId) ?? ""
        talent = try container.decodeIfPresent(String.self, forKey: .talent) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        birthday = try container.decodeIfPresent(String.self, forKey: .birthday) ?? ""
        location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
        city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        bio = try container.decodeIfPresent(String.self, forKey: .bio) ?? ""
        role = try container.decodeIfPresent(String.self, forKey: .role) ?? ""
        game = try container.decodeIfPresent(String.self, forKey: .game) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        playerImage = try container.decodeIfPresent(String.self, forKey: .playerImge) ?? ""
        coverImage = try container.decodeIfPresent(String.self, forKey: .coverImage) ?? ""
        teamName = try container.decodeIfPresent(String.self, forKey: .teamName) ?? ""
        teamImage = try container.decodeIfPresent(String.self, forKey: .teamImage) ?? ""
    }
}
