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
        static let CSGO = UIImage(named: "CSGO", in: .main, compatibleWith: nil)
        static let APEX_LEGEND = UIImage(named: "APEX_LEGEND", in: .main, compatibleWith: nil)
        static let FORTNITE = UIImage(named: "FORTNITE", in: .main, compatibleWith: nil)
        static let COD = UIImage(named: "COD", in: .main, compatibleWith: nil)
        static let FIFA = UIImage(named: "FIFA", in: .main, compatibleWith: nil)
        static let FREEFIRE = UIImage(named: "FREEFIRE", in: .main, compatibleWith: nil)
        static let AUTO_CHESS = UIImage(named: "AUTOCHESS", in: .main, compatibleWith: nil)
        
        static let ALL_Selected = UIImage(named: "All_Selected", in: .main, compatibleWith: nil)
        static let AOV_Selected = UIImage(named: "AOV_Selected", in: .main, compatibleWith: nil)
        static let DOTA_Selected = UIImage(named: "DOTA_Selected", in: .main, compatibleWith: nil)
        static let LOLWR_Selected = UIImage(named: "LOLWR_Selected", in: .main, compatibleWith: nil)
        static let MLBB_Selected = UIImage(named: "MLBB_Selected", in: .main, compatibleWith: nil)
        static let PUBGM_Selected = UIImage(named: "PUBGM_Selected", in: .main, compatibleWith: nil)
        static let VALORANT_Selected = UIImage(named: "VALORANT_Selected", in: .main, compatibleWith: nil)
        static let CSGO_Selected = UIImage(named: "CSGO_Selected", in: .main, compatibleWith: nil)
        static let APEX_LEGEND_Selected = UIImage(named: "APEX_LEGEND_Selected", in: .main, compatibleWith: nil)
        static let FORTNITE_Selected = UIImage(named: "FORTNITE_Selected", in: .main, compatibleWith: nil)
        static let COD_Selected = UIImage(named: "COD_Selected", in: .main, compatibleWith: nil)
        static let FIFA_Selected = UIImage(named: "FIFA_Selected", in: .main, compatibleWith: nil)
        static let FREEFIRE_Selected = UIImage(named: "FREEFIRE_Selected", in: .main, compatibleWith: nil)
        static let AUTO_CHESS_Selected = UIImage(named: "AUTOCHESS_Selected", in: .main, compatibleWith: nil)
       
    }
    
    enum GameImages {
        
        static let DOTA_IMAGE = UIImage(named: "Dota_Image", in: .main, compatibleWith: nil)
        static let MLBB_IMAGE = UIImage(named: "MLBB_Image", in: .main, compatibleWith: nil)
        static let PUBG_IMAGE = UIImage(named: "PUBG_Image", in: .main, compatibleWith: nil)
        static let CSGO_IMAGE = UIImage(named: "CSGO_Image", in: .main, compatibleWith: nil)
        static let WILDRIFE_IMAGE = UIImage(named: "WildRife_Image", in: .main, compatibleWith: nil)
        static let FIFA_IMAGE = UIImage(named: "FIFA_Image", in: .main, compatibleWith: nil)
        static let VALORANT_IMAGE = UIImage(named: "VALORANT_Image", in: .main, compatibleWith: nil)
        static let Fortnite_IMAGE = UIImage(named: "Fortnite_Image", in: .main, compatibleWith: nil)
        static let AOV_IMAGE = UIImage(named: "AOV_Image", in: .main, compatibleWith: nil)
        static let Freefire_IMAGE = UIImage(named: "Freefire_Image", in: .main, compatibleWith: nil)
        static let APEX_IMAGE = UIImage(named: "APEX_Image", in: .main, compatibleWith: nil)
        static let CallOfDuty_IMAGE = UIImage(named: "CallOfDuty_Image", in: .main, compatibleWith: nil)
        static let AutoChess_IMAGE = UIImage(named: "AutoChess_Image", in: .main, compatibleWith: nil)
        
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
                return AOV_IMAGE
            case "valorant":
                return VALORANT_IMAGE
            case "freefire":
                return Freefire_IMAGE
            case "fifa":
                return FIFA_IMAGE
            case "apex":
                return APEX_IMAGE
            case "callOfDuty":
                return CallOfDuty_IMAGE
            case "autoChess":
                return AutoChess_IMAGE
            default:
                return nil
            }
        }
    }
    
    enum SocialLogo {
        
        static let facebook = UIImage(named: "facebook", in: .main, compatibleWith: nil)
        static let youtube = UIImage(named: "youtube", in: .main, compatibleWith: nil)
        static let twitch = UIImage(named: "twitch", in: .main, compatibleWith: nil)
        static let twitter = UIImage(named: "twitter", in: .main, compatibleWith: nil)
        static let facebookPage = UIImage(named: "facebook_page", in: .main, compatibleWith: nil)
        static let instagram = UIImage(named: "instagram", in: .main, compatibleWith: nil)
        static let website = UIImage(named: "website", in: .main, compatibleWith: nil)
        static let discord = UIImage(named: "discord", in: .main, compatibleWith: nil)
        
        static func getImage(socialName: String) -> UIImage? {
            switch socialName {
            case "facebook_page":
                return facebookPage
            case "facebook":
                return facebook
            case "youtube":
                return youtube
            case "twitch":
                return twitch
            case "twitter":
                return twitter
            case "instagram":
                return instagram
            case "web":
                return website
            case "discord":
                return discord
            default:
                return nil
            }
        }
    }
    
    
    enum Placeholder {
        static let profile = UIImage(named: "profile", in: .main, compatibleWith: nil)
        static let cover = UIImage(named: "cover", in: .main, compatibleWith: nil)
    }
}
