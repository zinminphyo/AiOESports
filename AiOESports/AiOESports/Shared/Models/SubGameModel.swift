//
//  SubGameModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/04/2023.
//

import Foundation


struct SubGameModel: Decodable {
    let id: Int
    let talentId: String
    let game: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, game
        case talentId = "talent_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        talentId = try container.decodeIfPresent(String.self, forKey: .talentId) ?? ""
        game = try container.decodeIfPresent(String.self, forKey: .game) ?? ""
    }
}
