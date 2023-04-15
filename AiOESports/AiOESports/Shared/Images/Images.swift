//
//  Images.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/03/2023.
//

import Foundation
import UIKit



class Images {
    static let logo = UIImage(named: "logo", in: .main, compatibleWith: nil)
    static let countryImage = UIImage(named: "countrycode", in: .main, compatibleWith: nil)
    static let rememberFalse = UIImage(named: "rememberFalse", in: .main, compatibleWith: nil)
    static let menulogo = UIImage(named: "menulogo", in: .main, compatibleWith: nil)
    static let notilogo = UIImage(named: "notilogo", in: .main, compatibleWith: nil)
    static let backlogo = UIImage(named: "backlogo", in: .main, compatibleWith: nil)
    
    enum InAppImages {
        static let homelogo = UIImage(named: "homelogo", in: .main, compatibleWith: nil)
        static let ranklogo = UIImage(named: "ranklogo", in: .main, compatibleWith: nil)
        static let matchlogo = UIImage(named: "matchlogo", in: .main, compatibleWith: nil)
        static let tourlogo = UIImage(named: "tourlogo", in: .main, compatibleWith: nil)
        static let shoplogo = UIImage(named: "shoplogo", in: .main, compatibleWith: nil)
    }
    
    enum RankModuleImages {
        static let filterlogo = UIImage(named: "filterlogo", in: .main, compatibleWith: nil)
        static let searchlogo = UIImage(named: "searchlogo", in: .main, compatibleWith: nil)
    }
    
    enum TeamImages {
        static let gamecategorylogo = UIImage(named: "gamecategorylogo", in: .main, compatibleWith: nil)
        static let teamlogo = UIImage(named: "teamlogo", in: .main, compatibleWith: nil)
    }
    
    enum FilterSettings {
        static let selectedIcon = UIImage(named: "selected", in: .main, compatibleWith: nil)
        static let unselectedIcon = UIImage(named: "unselected", in: .main, compatibleWith: nil)
    }
    
    enum GameLogo {
        static let ALL = UIImage(named: "All", in: .main, compatibleWith: nil)
        static let AOV = UIImage(named: "AOV", in: .main, compatibleWith: nil)
        static let DOTA = UIImage(named: "DOTA", in: .main, compatibleWith: nil)
        static let LOLWR = UIImage(named: "LOLWR", in: .main, compatibleWith: nil)
        static let MLBB = UIImage(named: "MLBB", in: .main, compatibleWith: nil)
        static let PUBGM = UIImage(named: "PUBGM", in: .main, compatibleWith: nil)
        static let VALORANT = UIImage(named: "VALORANT", in: .main, compatibleWith: nil)
        
        static let DOTA_IMAGE = UIImage(named: "Dota_Image", in: .main, compatibleWith: nil)
        static let MLBB_IMAGE = UIImage(named: "MLBB_Image", in: .main, compatibleWith: nil)
        static let PUBG_IMAGE = UIImage(named: "PUBG_Image", in: .main, compatibleWith: nil)
        static let CSGO_IMAGE = UIImage(named: "CSGO_Image", in: .main, compatibleWith: nil)
        static let WILDRIFE_IMAGE = UIImage(named: "WildRife_Image", in: .main, compatibleWith: nil)
        
        static func getImage(gameName: String) -> UIImage? {
            switch gameName {
            case "mlbb" :
                return MLBB_IMAGE
            case "dota":
                return DOTA_IMAGE
            case "csgo":
                return CSGO_IMAGE
            case "pubg":
                return PUBG_IMAGE
            case "lolwr":
                return WILDRIFE_IMAGE
            case "aov":
                return AOV
            case "valorant":
                return VALORANT
            default:
                return nil
            }
        }
    }
    
    enum SocialLogo {
        static let facebook = UIImage(named: "facebook", in: .main, compatibleWith: nil)
        static let youtube = UIImage(named: "youtube", in: .main, compatibleWith: nil)
        static let twitch = UIImage(named: "twitch", in: .main, compatibleWith: nil)
        static let line = UIImage(named: "line", in: .main, compatibleWith: nil)
        
        static func getImage(socialName: String) -> UIImage? {
            switch socialName {
            case "facebook_page":
                return facebook
            case "facebook":
                return facebook
            case "youtube":
                return youtube
            case "twitch":
                return twitch
            case "line":
                return line
            case "instagram":
                return line
            default:
                return nil
            }
        }
    }
}
