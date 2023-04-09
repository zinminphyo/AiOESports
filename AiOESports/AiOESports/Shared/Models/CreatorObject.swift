//
//  CreatorObject.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation

/*
 "id": 37,
                 "team_id": null,
                 "talent": "creator",
                 "name": "AIRSTYLE",
                 "status": "active",
                 "full_name": "Myo Kyaw",
                 "birthday": "30.12.2000",
                 "location": "images/flag/mm.png",
                 "city": "Mandalay",
                 "bio": "Global 1+",
                 "game": "mlbb",
                 "role": "Streamer",
                 "player_image": "images/game/mlbb/Creator/airstyle_profile.png",
                 "cover_image": "images/game/mlbb/Creator/airstyle_cover.png",
                 "sort_no": "1",
                 "visable": "1",
                 "created_at": "2022-10-01T16:22:02.000000Z",
                 "updated_at": "2022-10-01T16:22:02.000000Z"
 */

struct CreatorObject: Decodable {
    let id: Int
    let teamId: Int?
    let talent: String?
    let name: String
    let status: String?
    let fullName: String
    let birthday: String?
    let location: String?
    var locationFullImage: String {
        return ""
    }
    let city: String
    let bio: String?
    let game: String?
    let role: String?
    let playerImage: String?
    var playerImageFullURL: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (playerImage ?? "")
    }
    let coverImage: String?
    var coverImageFullURL: String {
        return NetworkBaseURLs.shared.baseURL + "/" + (coverImage ?? "")
    }
    let sortNum: String?
    let visable: String?
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, talent, name, status, birthday, location, city, bio, game, role, visable
        case teamId = "team_id"
        case fullName = "full_name"
        case playerImage = "player_image"
        case coverImage = "cover_image"
        case sortNum = "sort_no"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


extension CreatorObject: RankPresentable {
    
    func getImageURLPath() -> String {
        return playerImageFullURL
    }
    
    func getName() -> String {
        return name
    }
    
    func getGameType() -> String {
        return game ?? ""
    }
    
    func getLocation() -> String {
        return city
    }
    
    
}
