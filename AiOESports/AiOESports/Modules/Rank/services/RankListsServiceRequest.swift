//
//  RankListsServiceRequest.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/12/2023.
//

import Foundation


struct RankListsServiceRequest {
    let gameType: GameType
    let status: FilterStatus
    let page: Int
}
