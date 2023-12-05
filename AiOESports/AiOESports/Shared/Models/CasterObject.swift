//
//  CasterObject.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation


struct CasterObject: Decodable {
    let id: Int
    let teamID: Int?
    let talent, name, status, fullName: String?
    let birthday, location, city, bio: String?
    let game, role, playerImage, coverImage: String?
    let sortNo, visable, createdAt, updatedAt: String?
    let total_follower: Int
    let total_rate_user: Int
    let total_rate_star: Int
    
    var playerImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (playerImage ?? "")
    }
    
    var coverImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (coverImage ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case total_follower
        case total_rate_user
        case total_rate_star
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
    }
}


extension CasterObject: RankPresentable {
    func getId() -> Int {
        return id
    }
 
    func getImageURLPath() -> String {
        return playerImageFullPath
    }
    
    func getName() -> String {
        return name ?? ""
    }
    
    func getGameType() -> String {
        return game ?? ""
    }
    
    func getLocation() -> String {
        return city ?? ""
    }
    
    
}
