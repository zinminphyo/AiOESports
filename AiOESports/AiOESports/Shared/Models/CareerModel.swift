//
//  CareerModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


struct CareerModel: Decodable {
    let fromTime: String
    let toTime: String
    let teamName: String
    let teamImage: String
    let id: Int
    let city: String
    let location: String
    
    var teamImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + teamImage
    }
    
    var locationImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + location
    }
    
    enum CodingKeys: String, CodingKey {
        case fromTime = "from_time"
        case toTime = "to_time"
        case teamName = "team_name"
        case teamImage = "team_image"
        case id, city, location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fromTime = try container.decodeIfPresent(String.self, forKey: .fromTime) ?? ""
        toTime = try container.decodeIfPresent(String.self, forKey: .toTime) ?? ""
        teamName = try container.decodeIfPresent(String.self, forKey: .teamName) ?? ""
        teamImage = try container.decodeIfPresent(String.self, forKey: .teamImage) ?? ""
        id = try container.decode(Int.self, forKey: .id)
        city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
    }
}
