//
//  TeamRankListsServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/12/2023.
//

import Foundation


protocol TeamRankListsServiceProtocol {
    func fetchTeamLists(request: RankListsServiceRequest) async throws -> [TeamObject]
}
