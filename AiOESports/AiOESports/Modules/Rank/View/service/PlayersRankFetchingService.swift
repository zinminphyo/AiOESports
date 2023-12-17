//
//  PlayersRankFetchingService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/12/2023.
//

import Foundation
import Alamofire



struct PlayersRankFetchingService: PlayersRankFetchingServiceProtocol {
    func fetch(request: PlayersRankListRequest) async throws -> PaginationNetworkResponse<PlayerObject> {
        let params: Parameters = [
            "gameType" : request.type.value,
            "status" : request.status.value,
            "page" : request.page
        ]
        let req = AF.request(request, method: .get, parameters: params).serializingData()
        let response = await req.response
        let data = try response.result.get()
        return try JSONDecoder().decode(PaginationNetworkResponse<PlayerObject>.self, from: data)
    }
}
