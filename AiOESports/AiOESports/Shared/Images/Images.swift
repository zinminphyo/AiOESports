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
    }
}
