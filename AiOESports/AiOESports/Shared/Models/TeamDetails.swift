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
    
    let detail: TeamDetailsModel
    let social: [SocialModel]
    let squad: SquadModel
    let achivemets: [AchivementModel]
    let sponsors: [SponsorModel]
    let formerPlayers: [FormerPlayerModel]
    
    enum CodingKeys: String, CodingKey {
        case squad = "player"
        case achivements = "achieve"
        case sponsors = "sponsor"
        case formerPlayers = "former_player"
        case result
        case data
        case stats
        case detail
        case social
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let resultContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
        let dataContainer = try resultContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        squad = try dataContainer.decodeIfPresent(SquadModel.self, forKey: .squad) ?? SquadModel(headCoach: nil, assistantCoach: nil, technicalDirector: nil, analyst: nil, roster: [])
        achivemets = try dataContainer.decodeIfPresent([AchivementModel].self, forKey: .achivements) ?? []
        sponsors = try dataContainer.decodeIfPresent([SponsorModel].self, forKey: .sponsors) ?? []
        formerPlayers = try dataContainer.decodeIfPresent([FormerPlayerModel].self, forKey: .formerPlayers) ?? []
        
        let statsContainer = try dataContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .stats)
        detail = try statsContainer.decode(TeamDetailsModel.self, forKey: .detail)
        social = try statsContainer.decodeIfPresent([SocialModel].self, forKey: .social) ?? []
    }
}
