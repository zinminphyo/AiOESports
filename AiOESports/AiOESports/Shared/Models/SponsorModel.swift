//
//  SponsorModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


struct SponsorModel: Decodable {
    let id: Int
    let tourId: String
    let playerId: String
    let teamId: String
    let name: String
    let sponsorLogo: String
    let sortNum: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case tourId = "tour_id"
        case playerId = "player_id"
        case teamId = "team_id"
        case sponsorLogo = "sponsor_logo"
        case sortNum = "sort_no"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        tourId = try container.decodeIfPresent(String.self, forKey: .tourId) ?? ""
        playerId = try container.decodeIfPresent(String.self, forKey: .playerId) ?? ""
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId) ?? ""
        name = try container.decode(String.self, forKey: .name)
        sponsorLogo = try container.decodeIfPresent(String.self, forKey: .sponsorLogo) ?? ""
        sortNum = try container.decode(String.self, forKey: .sortNum)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
}
