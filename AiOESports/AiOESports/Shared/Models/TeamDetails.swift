//
//  TeamDetails.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation

/*
 
 "headcoach": {
     "id": 20,
     "team_id": "4",
     "talent": "player",
     "name": "PVNDV",
     "status": "active",
     "full_name": "Win Thuta Htut",
     "birthday": "6.8.1997",
     "location": "images/flag/mm.png",
     "city": "Yangon",
     "bio": "111111",
     "game": "mlbb",
     "role": "Head Coach",
     "player_image": "images/game/mlbb/Player/pvndv_profile.png",
     "cover_image": "images/game/mlbb/Player/pvndv_cover.png",
     "sort_no": "2",
     "visable": "1",
     "created_at": "2022-09-30T20:22:38.000000Z",
     "updated_at": "2022-09-30T20:22:38.000000Z"
 },
 "asistcoach": {
     "id": 34,
     "team_id": "4",
     "talent": "player",
     "name": "DJ",
     "status": "active",
     "full_name": "Daung Jaune",
     "birthday": null,
     "location": "images/flag/mm.png",
     "city": "Yangon",
     "bio": null,
     "game": "mlbb",
     "role": "Assistant Coach",
     "player_image": null,
     "cover_image": null,
     "sort_no": "1",
     "visable": "1",
     "created_at": "2022-09-30T21:40:19.000000Z",
     "updated_at": "2022-09-30T21:40:19.000000Z"
 },
 "technicaldirector": null,
 "analyst": null,
 "roster": [
     {
         "id": 21,
         "name": "ACE",
         "talent": "player",
         "player_image": "images/game/mlbb/Player/ace_profile.png",
         "game": "mlbb",
         "location": "images/flag/mm.png",
         "city": "Yangon"
     },
     {
         "id": 25,
         "name": "ALITAAA",
         "talent": "player",
         "player_image": "images/game/mlbb/Player/alitaaa_profile.png",
         "game": "mlbb",
         "location": "images/flag/mm.png",
         "city": "Yangon"
     },
     {
         "id": 22,
         "name": "DEE",
         "talent": "player",
         "player_image": "images/game/mlbb/Player/dee_profile.png",
         "game": "mlbb",
         "location": "images/flag/mm.png",
         "city": "Yangon"
     },
     {
         "id": 24,
         "name": "KID",
         "talent": "player",
         "player_image": "images/game/mlbb/Player/dee_profile.png",
         "game": "mlbb",
         "location": "images/flag/mm.png",
         "city": "Yangon"
     },
     {
         "id": 23,
         "name": "MAY BE",
         "talent": "player",
         "player_image": "images/game/mlbb/Player/maybe_profile.png",
         "game": "mlbb",
         "location": "images/flag/mm.png",
         "city": "Yangon"
     }
 ]
}
 */

struct TeamDetails: Decodable {
    
    let headcoach: Coach?
    let asistcoach: Coach?
    let technicaldirector: Coach?
    let analyst: Coach?
    let roster: [Roster]
    
    
    enum CodingKeys: String, CodingKey {
        case headcoach, asistcoach, technicaldirector, analyst, roster
        case result
        case data
        case player
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let resultContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
        let dataContainer = try resultContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        let playerContainer = try dataContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .player)
        headcoach = try playerContainer.decodeIfPresent(Coach.self, forKey: .headcoach)
        asistcoach = try playerContainer.decodeIfPresent(Coach.self, forKey: .headcoach)
        technicaldirector = try playerContainer.decodeIfPresent(Coach.self, forKey: .technicaldirector)
        analyst = try playerContainer.decodeIfPresent(Coach.self, forKey: .analyst)
        roster = try playerContainer.decodeIfPresent([Roster].self, forKey: .roster) ?? []
    }
    
    struct Coach: Decodable {
        let id: Int
        let teamID, talent, name, status: String?
        let fullName, birthday, location, city: String?
        let bio, game, role, playerImage: String?
        let coverImage, sortNo, visable: String?
        let createdAt: String
        let updatedAt: String
        
        var playerImageFullURL: String {
            return NetworkBaseURLs.shared.baseURL + "/" + (playerImage ?? "")
        }
        
        var coverImageFullURL: String {
            return NetworkBaseURLs.shared.baseURL + "/" + (coverImage ?? "")
        }
        
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
        }
    }
    
    struct Roster: Decodable {
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
    
}
