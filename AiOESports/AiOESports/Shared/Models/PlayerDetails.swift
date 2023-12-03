//
//  PlayerDetails.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


struct PlayerDetails: Decodable {
    
    struct PlayerTotalFollingRating: Decodable {
        let talentRank: Int
        let totalFollowers: Int
        let totalRating: Int
        let totalRatingStars: String
    }
    
    let userFollowVoteStats: UserFollowVoteStats?
    let totalFollowRating: PlayerTotalFollingRating
    let details: PlayerDetailsModel
    let signature: [SignatureModel]
    let social: [SocialModel]
    let career: [CareerModel]
    let playerAchivement: PlayerAchivement
    let mainGame: String
    let subGames: [SubGameModel]
    
    enum CodingKeys: String, CodingKey {
        case result
        case userFollowVoteStats = "UserFollowVoteStats"
        case totalFollowRating = "TotalFollowRating"
        case data
        case stats
        case details = "detail"
        case signature
        case career
        case social
        case mainGame = "main_game"
        case subGames = "sub_games"
        case playerAchivement = "achieve"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let result = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
        let data = try result.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        userFollowVoteStats = try data.decodeIfPresent(UserFollowVoteStats.self, forKey: .userFollowVoteStats)
        totalFollowRating = try data.decode(PlayerTotalFollingRating.self, forKey: .totalFollowRating)
        career = try data.decodeIfPresent([CareerModel].self, forKey: .career) ?? []
        playerAchivement = try data.decode(PlayerAchivement.self, forKey: .playerAchivement)
        let status = try data.nestedContainer(keyedBy: CodingKeys.self, forKey: .stats)
        details = try status.decode(PlayerDetailsModel.self, forKey: .details)
        signature = try status.decodeIfPresent([SignatureModel].self, forKey: .signature) ?? []
        social = try status.decodeIfPresent([SocialModel].self, forKey: .social) ?? []
        mainGame = try status.decodeIfPresent(String.self, forKey: .mainGame) ?? ""
        subGames = try status.decodeIfPresent([SubGameModel].self, forKey: .subGames) ?? []
    }
}
