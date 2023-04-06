//
//  Enums.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


enum GameType {
    case all
    case mobilLegend
    case dota
    case aov
    case pubg
    
    var value: String {
        switch self {
        case .all:
            return "all"
        case .mobilLegend:
            return "mobilelegend"
        case .dota:
            return ""
        case .aov:
            return ""
        case .pubg:
            return ""
        }
    }
}

enum FilterStatus {
    case all
    case active
    case unActive
    case freeAgent
    
    var value: String {
        switch self {
        case .all:
            return "all"
        case .active:
            return "active"
        case .unActive:
            return "unactive"
        case .freeAgent:
            return "freeagent"
        }
    }
}

enum RankCategory: CaseIterable {
    case team
    case player
    case caster
    case creator
    
    var title: String {
        switch self {
        case .team:
            return "TEAMS"
        case .player:
            return "PLAYERS"
        case .caster:
            return "CASTERS"
        case .creator:
            return "CREATORS"
        }
    }
}
