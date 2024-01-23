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
    case AOV
    case LOLWR
    case Dota
    case PUBGM
    case CSGO
    case Valorant
    case HOK
    case FIFA
    case EFootball
    case PC
    case MOBILE
    case CONSOLE
    
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
        case .LOLWR:
            return "lolwr"
        case .HOK:
            return "hok"
        case .FIFA:
            return "fifa"
        case .EFootball:
            return "efootball"
        case .PC:
            return "pc"
        case .MOBILE:
            return "mobile"
        case .CONSOLE:
            return "console"
        }
    }
    
    var unselectedStateImage: UIImage? {
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
            return Images.GameLogo.CSGO
        case .Valorant:
            return Images.GameLogo.VALORANT
        case .LOLWR:
            return Images.GameLogo.LOLWR
        case .HOK:
            return Images.GameLogo.HOK
        case .FIFA:
            return Images.GameLogo.FIFA
        case .EFootball:
            return Images.GameLogo.EFootball
        case .PC:
            return Images.GameLogo.PC
        case .MOBILE:
            return Images.GameLogo.Mobile
        case .CONSOLE:
            return Images.GameLogo.Console
        }
    }
    
    var selectedStateImage: UIImage? {
        switch self {
        case .All:
            return Images.GameLogo.ALL_Selected
        case .MobileLegend:
            return Images.GameLogo.MLBB_Selected
        case .Dota:
            return Images.GameLogo.DOTA_Selected
        case .AOV:
            return Images.GameLogo.AOV_Selected
        case .PUBGM:
            return Images.GameLogo.PUBGM_Selected
        case .CSGO:
            return Images.GameLogo.CSGO_Selected
        case .Valorant:
            return Images.GameLogo.VALORANT_Selected
        case .LOLWR:
            return Images.GameLogo.LOLWR_Selected
        case .HOK:
            return Images.GameLogo.HOK_Selected
        case .FIFA:
            return Images.GameLogo.FIFA_Selected
        case .EFootball:
            return Images.GameLogo.EFootball_Selected
        case .PC:
            return Images.GameLogo.PC_Selected
        case .MOBILE:
            return Images.GameLogo.Mobile_Selected
        case .CONSOLE:
            return Images.GameLogo.Console_Selected
        }
    }
    
}

enum SortableGames: String, CaseIterable, Codable {
    case mlbb
    case dota
    case aov
    case pubg
    case csgo
    case valorant
    case lolwr
    case hok
    case fifa
    case fortnite
    case apexlegend
    case autochess
    
    var image: UIImage? { Images.GameImages.getImage(gameName: self.rawValue) }
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
    case all
    
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
        case .all:
            return "All"
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
        case .all:
            return "all"
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
            return "SQUAD"
        case .formerPlayer:
            return "FORMER PLAYERS"
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


enum CreatorDetailContent: CaseIterable {
    case overview
    
    var title: String {
        switch self {
        case .overview:
            return "OVERVIEW"
        }
    }
}
