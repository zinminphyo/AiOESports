//
//  BannerModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


struct BannerModel: Decodable {
    let id: Int
    let url: String
    let link: String
    let platform: String
    let createdAt: String
    let updatedAt: String
    
    var urlFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + url
    }
    
    enum CodingKeys: String, CodingKey {
        case id, platform
        case url = "banner_url"
        case link = "banner_link"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
        platform = try container.decodeIfPresent(String.self, forKey: .platform) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}
