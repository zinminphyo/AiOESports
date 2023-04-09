//
//  PlayerObject.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation


struct PlayerObject: Decodable {
        let id: Int
        let teamID, talent, name, status: String?
        let fullName, birthday, location, city: String?
        let bio: String?
        let game, role, playerImage, coverImage: String?
        let sortNo, visable, createdAt, updatedAt: String?
        let teamName, teamImage: String?

        enum CodingKeys: String, CodingKey {
            case id
            case teamID = "team_id"
            case talent, name, status
            case fullName = "full_name"
            case birthday, location, city, bio, game, role
            case playerImage = "player_image"
            case coverImage = "cover_image"
            case sortNo = "sort_no"
            case visable
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case teamName = "team_name"
            case teamImage = "team_image"
        }
}

extension PlayerObject: RankPresentable {
    
    func getImageURLPath() -> String {
        return ApiRouter.fetchPlayerLists(.All, .active, 1).baseURL + "/" + (playerImage ?? "")
    }
    
    func getName() -> String {
        return name ?? "Name"
    }
    
    func getGameType() -> String {
        return "MLBB"
    }
    
    func getLocation() -> String {
        return city ?? "Location"
    }
    
}
