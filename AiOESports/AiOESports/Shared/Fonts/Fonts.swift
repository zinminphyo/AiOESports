//
//  Fonts.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/04/2023.
//

import Foundation
import UIKit



class Fonts {
    static let titleFont = UIFont(name: "DMSans-Medium", size: 20)
    static let subtitleFont = UIFont(name: "DMSans-Regular", size: 14)
    
    enum ForCell {
        static let titleFont = UIFont(name: "DMSans-Medium", size: 13)
        static let subtitleFont = UIFont(name: "DMSans-Regular", size: 12)
    }
}


extension Fonts {
    static func rankFont(rank: Int) -> UIFont? {
        switch rank {
        case 1,2,3:
            return UIFont(name: "DMSans-Bold", size: 24)
        default:
            return UIFont(name: "DMSans-Medium", size: 16)
        }
    }
}
