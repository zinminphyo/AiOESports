//
//  HomeModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


struct HomeModel: Decodable {
    let bannerLists: [BannerModel]
    let adLists: [AdvertisementModel]
    
    enum CodingKeys: String, CodingKey {
        case result
        case data
        case bannerLists = "Banner"
        case adLists = "Advertisement"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let result = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
        let data = try result.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        bannerLists = try data.decodeIfPresent([BannerModel].self, forKey: .bannerLists) ?? []
        adLists = try data.decodeIfPresent([AdvertisementModel].self, forKey: .adLists) ?? []
    }
}
