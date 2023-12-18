//
//  AchivementModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation
import UIKit

struct AchivementModel: Decodable {
    let name: String
    let logo: String
    let tier: String
    let place: String
    var renderablePlace: String {
        switch place {
        case "1":
            return "Champion".uppercased()
        case "2":
            return "SECOND Place"
        default:
            return place
        }
    }
    var placeColor: UIColor? {
        switch place {
        case "1":
            return Colors.Button.primaryColor
        case "2", "3":
            return Colors.Text.primaryText
        default:
            return Colors.Text.secondaryText
        }
    }
    let sortNum: Int
    
    var logoFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + logo
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "tour_name"
        case logo = "tour_logo"
        case tier, place
        case sortNum = "sort_no"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        logo = try container.decodeIfPresent(String.self, forKey: .logo) ?? ""
        tier = try container.decodeIfPresent(String.self, forKey: .tier) ?? ""
        place = try container.decodeIfPresent(String.self, forKey: .place) ?? ""
        sortNum = try container.decode(Int.self, forKey: .sortNum)
    }
}
