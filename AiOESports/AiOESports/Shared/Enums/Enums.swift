//
//  Enums.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation
import UIKit

enum GameType: CaseIterable {
    case All
    case MobileLegend
    case Dota
    case AOV
    case PUBGM
    case CSGO
    case Valorant
    case LolWR
    case HOK
    case FIFA
    
    var value: String {
        switch self {
        case .All:
            return "all"
        case .MobileLegend:
            return "mlbb"
        case .Dota:
            return "dota"
        case .AOV:
            return "aov"
        case .PUBGM:
            return "pubg"
        case .CSGO:
            return "csgo"
        case .Valorant:
            return "valorant"
        case .LolWR:
            return "lolwr"
        case .HOK:
            return "hok"
        case .FIFA:
            return "fifa"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .All:
            return Images.GameLogo.ALL
        case .MobileLegend:
            return Images.GameLogo.MLBB
        case .Dota:
            return Images.GameLogo.DOTA
        case .AOV:
            return Images.GameLogo.AOV
        case .PUBGM:
            return Images.GameLogo.PUBGM
        case .CSGO:
            return Images.GameLogo.AOV
        case .Valorant:
            return Images.GameLogo.PUBGM
        case .LolWR:
            return Images.GameLogo.LOLWR
        case .HOK:
            return Images.GameLogo.PUBGM
        case .FIFA:
            return Images.GameLogo.DOTA
        }
    }
}

enum TeamFilterStatus: CaseIterable {
    case active
    case inActive
    case disbanded
    
    var value: String {
        switch self {
        case .active:
            return "active"
        case .inActive:
            return "inActive"
        case .disbanded:
            return "disbanded"
        }
    }
    
    var title: String {
        switch self {
        case .active:
            return "Active"
        case .inActive:
            return "InActive"
        case .disbanded:
            return "Disbanded"
        }
    }
}

enum PlayerFilterStatus: CaseIterable {
    case active
    case inactive
    case retired
    case free
    
    var title: String {
        switch self {
        case .active:
            return "Active"
        case .inactive:
            return "InActive"
        case .retired:
            return "Retried"
        case .free:
            return "Free Agent"
        }
    }
    
    var value: String {
        switch self {
        case .active:
            return "active"
        case .inactive:
            return "inactive"
        case .retired:
            return "retired"
        case .free:
            return "Free"
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


enum TeamDetailsContent: CaseIterable {
    
    case overview
    case achivement
    case roster
    case formerPlayer
    case sponsor
    
    var title: String {
        switch self {
        case .overview:
            return "OVERVIEW"
        case .achivement:
            return "ACHIVEMENTS"
        case .roster:
            return "ROSTER"
        case .formerPlayer:
            return "FORMER PLAYER"
        case .sponsor:
            return "SPONSOR"
        }
    }
}

enum PlayerDetailsContent: CaseIterable {
    case overview
    case achivement
    case career
    
    var title: String {
        switch self {
        case .overview:
            return "OVERVIEW"
        case .achivement:
            return "ACHIVEMENT"
        case .career:
            return "CAREER"
        }
    }
}


enum CasterDetailsContent: CaseIterable {
    case overview
    case achivement
    
    var title: String {
        switch self {
        case .overview:
            return "OVERVIEW"
        case .achivement:
            return "ACHIVEMENT"
        }
    }
}
