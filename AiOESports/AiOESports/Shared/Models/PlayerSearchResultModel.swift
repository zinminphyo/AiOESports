//
//  PlayerSearchResultModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


struct PlayerSearchResultModel: Decodable {
    
    let name: String
    let id: Int
    let playerImage: String
    var playerImageFullURL: String {
        return ApiRouter.fetchTeamLists(.MobileLegend, .active, 0).baseURL + "/" + playerImage
    }
    let game: String
    let fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case name, id, game
        case playerImage = "player_image"
        case fullName = "full_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        id = try container.decode(Int.self, forKey: .id)
        playerImage = try container.decodeIfPresent(String.self, forKey: .playerImage) ?? ""
        game = try container.decodeIfPresent(String.self, forKey: .game) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
    }
}
