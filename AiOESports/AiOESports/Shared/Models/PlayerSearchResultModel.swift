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
        return ApiRouter.fetchTeamLists(.MobileLegend, .active).baseURL + "/" + playerImage
    }
    let game: String
    let fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case name, id, game
        case playerImage = "player_image"
        case fullName = "full_name"
    }
}
