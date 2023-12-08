//
//  Colors.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/03/2023.
//

import Foundation
import UIKit



class Colors {
    
    enum Theme {
        static let mainColor = UIColor(named: "ThemeColor", in: .main, compatibleWith: nil)
        static let inputColor = UIColor(named: "InputColor", in: .main, compatibleWith: nil)
        static let SecondaryBackground = UIColor(named: "SecondaryBackground", in: .main, compatibleWith: nil)
    }
    
    enum Button {
        static let secondaryColor = UIColor(named: "SecondaryColor", in: .main, compatibleWith: nil)
        static let primaryColor = UIColor(named: "PrimaryColor", in: .main, compatibleWith: nil)
        static let strokeColor = UIColor(named: "StrokeColor", in: .main, compatibleWith: nil)
    }
    
    
    enum Text {
        static let primaryText = UIColor(named: "PrimaryText", in: .main, compatibleWith: nil)
        static let incorrectText = UIColor(named: "IncorrectText", in: .main, compatibleWith: nil)
        static let secondaryText = UIColor(named: "SecondaryText", in: .main, compatibleWith: nil)
    }
    
    enum TabItem {
        static let home = UIColor(named: "Home", in: .main, compatibleWith: nil)!
        static let rank = UIColor(named: "Rank", in: .main, compatibleWith: nil)!
        static let match = UIColor(named: "Match", in: .main, compatibleWith: nil)!
        static let shop = UIColor(named: "Shop", in: .main, compatibleWith: nil)!
        static let tour = UIColor(named: "Tour", in: .main, compatibleWith: nil)!
    }
    
    
    enum Gradient {
        static let startColor = UIColor(named: "Start", in: .main, compatibleWith: nil)!
        static let endColor = UIColor(named: "End", in: .main, compatibleWith: nil)!
    }
}
