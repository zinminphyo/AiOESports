//
//  PlayerAchivement.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


struct PlayerAchivement: Decodable {
    
    let asCasters: [AchivementModel]
    let asCoach: [AchivementModel]
    let asPlayer: [AchivementModel]
    
    var isEmpty: Bool {
        asCasters.isEmpty && asCoach.isEmpty && asPlayer.isEmpty
    }
    
    enum CodingKeys: String, CodingKey {
        case asCasters = "as caster"
        case asCoach = "as coach"
        case asPlayer = "as player"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        asCasters = try container.decodeIfPresent([AchivementModel].self, forKey: .asCasters) ?? []
        asCoach = try container.decodeIfPresent([AchivementModel].self, forKey: .asCoach) ?? []
        asPlayer = try container.decodeIfPresent([AchivementModel].self, forKey: .asPlayer) ?? []
    }
}
