//
//  PlayerRankViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/12/2023.
//

import Foundation
import Combine


class PlayerRankViewModel {
    
    private let service = PlayersRankFetchingService()
    
    @Published
    var gameType: GameType = .All
    
    @Published
    var isFetching: Bool = false
    
    @Published
    var lists: [PlayerObject] = []
    
    @Published
    var hasMore: Bool = false
    
    
    private(set) var page: Int = 1
    
    
    func fetchLists() {
        isFetching = true
        Task {
            do {
                let request = PlayersRankListRequest(type: gameType, status: .all, page: page)
                let response = try await service.fetch(request: request)
                lists = response.data
                hasMore = response.pagination.hasMore
                guard hasMore else { return }
                page += 1
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isFetching = false
        }
    }
    
    func continuePagination() {
        Task {
            do {
                let request = PlayersRankListRequest(type: gameType, status: .all, page: page)
                let response = try await service.fetch(request: request)
                lists = response.data
                hasMore = response.pagination.hasMore
                guard hasMore else { return }
                page += 1
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
}
