//
//  SocialModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


struct SocialModel: Decodable {
    let id: Int
    let playerId: String
    let teamId: String
    let tourId: String
    let platform: String
    let link: String
    let sortNum: Int
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, platform, link
        case playerId = "player_id"
        case teamId = "team_id"
        case tourId = "tour_id"
        case sortNum = "sort_no"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        playerId = try container.decodeIfPresent(String.self, forKey: .playerId) ?? ""
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId) ?? ""
        tourId = try container.decodeIfPresent(String.self, forKey: .tourId) ?? ""
        platform = try container.decodeIfPresent(String.self, forKey: .platform) ?? ""
        link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
        sortNum = try container.decodeIfPresent(Int.self, forKey: .sortNum) ?? 0
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
