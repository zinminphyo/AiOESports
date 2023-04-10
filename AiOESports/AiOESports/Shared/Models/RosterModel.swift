//
//  Roster.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


struct RosterModel: Decodable {
    let id: Int
    let name, talent, playerImage, game: String?
    let location, city: String?
    
    var playerImageFullURL: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (playerImage ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, talent
        case playerImage = "player_image"
        case game, location, city
    }
}
