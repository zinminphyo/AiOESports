//
//  TeamObject.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/04/2023.
//

import Foundation




struct TeamObject: Codable {
    
    let id: Int
    let name: String
    let teamImage: String?
    let coverImage: String?
    var coverImageFullPath: String {
        return ApiRouter.fetchTeamLists(.All, .active, 0).baseURL + "/" + (coverImage ?? "")
    }
    let game: String
    let city: String
    let location: String
    let sortNo: String
    
    enum CodingKeys: String, CodingKey {
        case id, game, city, location
        case name = "team_name"
        case teamImage = "team_image"
        case coverImage = "cover_image"
        case sortNo = "sort_no"
    }
}


// MARK: - Rank Presentable.
extension TeamObject: RankPresentable {
    
    func getId() -> Int {
        return id
    }
    
    func getImageURLPath() -> String {
        return coverImageFullPath
    }
    
    func getName() -> String {
        return name
    }
    
    func getGameType() -> String {
        return game
    }
    
    func getLocation() -> String {
        return city
    }
    
    
}
