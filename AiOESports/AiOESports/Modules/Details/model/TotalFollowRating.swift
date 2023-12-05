//
//  TotalFollowRating.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation


struct TotalFollowRating: Decodable {
    let teamRank: Int
    let totalFollowers: Int
    let totalRating: Int
    let totalRatingStars: String
    
    enum CodingKeys: String, CodingKey {
        case teamRank
        case totalFollowers
        case totalRating
        case totalRatingStars
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamRank = try container.decode(Int.self, forKey: .teamRank)
        totalFollowers = try container.decode(Int?.self, forKey: .totalFollowers) ?? 0
        totalRating = try container.decode(Int?.self, forKey: .totalRating) ?? 0
        totalRatingStars = try container.decode(String?.self, forKey: .totalRatingStars) ?? ""
    }
}
