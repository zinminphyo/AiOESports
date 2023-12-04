//
//  TeamRankListsService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/12/2023.
//

import Foundation
import Alamofire


struct TeamRankListsService: TeamRankListsServiceProtocol {
    
    var baseURL: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)")!
    }
    
    func fetchTeamLists(request: RankListsServiceRequest) async throws -> [TeamObject] {
//        let url = baseURL.appendingPathComponent("/api/")
        return []
    }
    
    
}
