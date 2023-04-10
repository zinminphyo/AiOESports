//
//  FormerPlayerModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


struct FormerPlayerModel: Decodable {
    let id: Int
    let talent: String
    let name: String
    let playerImage: String
    let game: String
    let location: String
    let city: String
    let teamImage: String
    let fromTime: String
    let toTime: String
    
    var playerImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + playerImage
    }
    
    enum CodingKeys: String, CodingKey {
        case id, talent, name, game, location, city
        case playerImage = "player_image"
        case teamImage = "team_image"
        case fromTime = "from_time"
        case toTime = "to_time"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        talent = try container.decodeIfPresent(String.self, forKey: .talent) ?? ""
        name = try container.decode(String.self, forKey: .name)
        playerImage = try container.decodeIfPresent(String.self, forKey: .playerImage) ?? ""
        game = try container.decodeIfPresent(String.self, forKey: .game) ?? ""
        location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
        city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        teamImage = try container.decodeIfPresent(String.self, forKey: .teamImage) ?? ""
        fromTime = try container.decodeIfPresent(String.self, forKey: .fromTime) ?? ""
        toTime = try container.decodeIfPresent(String.self, forKey: .toTime) ?? ""
    }
}
