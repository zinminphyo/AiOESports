//
//  TeamSearchResultModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


struct TeamSearchResultModel: Decodable {
    
    let teamName: String
    let id: Int
    let teamImage: String
    var teamImageFullURL: String {
        ApiRouter.fetchTeamLists(.All, .active).baseURL + "/" + teamImage
    }
    let game: String
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case id, game
        case teamImage = "team_image"
        case fullName = "full_name"
    }
}
