//
//  PlayersRankFetchingServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/12/2023.
//

import Foundation
import Alamofire

struct PlayersRankListRequest: URLConvertible {
    let type: GameType
    let status: FilterStatus
    let page: Int
}

extension PlayersRankListRequest {
    func asURL() throws -> URL {
        let url = URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/player")!
        return url
    }
}


protocol PlayersRankFetchingServiceProtocol {
    func fetch(request: PlayersRankListRequest) async throws -> PaginationNetworkResponse<PlayerObject>
}
