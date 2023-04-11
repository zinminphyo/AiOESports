//
//  TeamDetailsModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


struct TeamDetailsModel: Decodable {
    let id: Int
    let name: String
    let status: String
    let foundedDate: String
    let fullName: String
    let location: String
    let city: String
    let owner: String?
    let manager: String?
    let bio: String
    let game: String
    let role: String
    let teamImage: String
    let coverImage: String
    let sortNum: String
    let visable: String
    let createdAt: String
    let updatedAt: String
    
    var teamImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + teamImage
    }
    
    var coverImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + coverImage
    }
    
    var locationImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + location
    }
    
    enum CodingKeys: String, CodingKey {
        case id, status, location, city, owner, manager, bio, game, role, visable
        case name = "team_name"
        case foundedDate = "founded_date"
        case fullName = "full_name"
        case teamImage = "team_image"
        case coverImage = "cover_image"
        case sortNum = "sort_no"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        foundedDate = try container.decodeIfPresent(String.self, forKey: .foundedDate) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
        city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        owner = try container.decodeIfPresent(String.self, forKey: .owner) ?? ""
        manager = try container.decodeIfPresent(String.self, forKey: .manager) ?? ""
        bio = try container.decodeIfPresent(String.self, forKey: .bio) ?? ""
        game = try container.decodeIfPresent(String.self, forKey: .game) ?? ""
        role = try container.decodeIfPresent(String.self, forKey: .role) ?? ""
        teamImage = try container.decodeIfPresent(String.self, forKey: .teamImage) ?? ""
        coverImage = try container.decodeIfPresent(String.self, forKey: .coverImage) ?? ""
        sortNum = try container.decodeIfPresent(String.self, forKey: .sortNum) ?? ""
        visable = try container.decodeIfPresent(String.self, forKey: .visable) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
