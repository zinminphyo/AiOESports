//
//  RankPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import Combine

class RankPresenter: RankPresenting {
    
    var router: RankRouting?
    
    var viewDelegate: RankViewDelegate?
    
    @Published
    var isFetching: Bool = false
    
    @Published
    var teamRankLists: [TeamObject] = []
    
    // MARK: For Player
    @Published
    var playerRankLists: [PlayerObject] = []
    @Published
    var playerLoadingLists: [String] = []
    
    // MARK: For Caster
    @Published
    var casterLists: [CasterObject] = []
    @Published
    var casterLoadingLists: [String] = []
    
    // MARK: For Creator
    @Published
    var creatorLists: [CreatorObject] = []
    @Published
    var creatorLoadingLists: [String] = []
    
    @Published
    var loadingLists: [String] = []
    
    @Published
    var rankCategory: RankCategory = .team
    
    private var teamLists: [TeamObject] = []
    private var rankLists: [RankPresentable] = []
    
    private var selectedCategory: RankCategory = .team
    private var selectedGameType: GameType = .All
    private var currentPage: Int = 1
    
    func fetchTeamLists(gameType: GameType, status: FilterStatus) {
        if self.currentPage == 1 {
            viewDelegate?.showLoading()
        }
        let router = ApiRouter.fetchTeamLists(selectedGameType, status, currentPage)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<TeamObject>,NetworkError>) in
            switch result {
            case .success(let success):
                if success.pagination.currentPage == 1 {
                    self.rankLists = success.data
                    self.viewDelegate?.renderCoverImage(url: success.data.first?.coverImageFullPath ?? "")
                } else {
                    self.rankLists.append(contentsOf: success.data)
                }
                self.viewDelegate?.renderRankLists(lists: self.rankLists)
                self.teamRankLists = success.data
                self.currentPage = success.pagination.currentPage + 1
                success.pagination.hasMore ? self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"]) : self.viewDelegate?.renderLoadingLists(loadingLists: [])
                self.loadingLists = success.pagination.hasMore ? ["loading"] : []
                self.viewDelegate?.hideLoading()
            case .failure(let failure):
                self.viewDelegate?.renderError(error: failure.localizedDescription)
                self.viewDelegate?.hideLoading()
            }
        }
    }
    
    func fetchPlayerLists(gameType: GameType, status: PlayerFilterStatus) {
        if self.currentPage == 1 {
            viewDelegate?.showLoading()
        }
        let router = ApiRouter.fetchPlayerLists(selectedGameType, status, currentPage)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<PlayerObject>,NetworkError>) in
            switch result {
            case .success(let success):
                if success.pagination.currentPage == 1 {
                    self.rankLists = success.data
                    self.viewDelegate?.renderCoverImage(url: success.data.first?.coverImageFullURL ?? "")
                } else {
                    self.rankLists.append(contentsOf: success.data)
                }
                self.currentPage = success.pagination.currentPage + 1
//                self.viewDelegate?.renderRankLists(lists: self.rankLists)
                self.playerRankLists = success.data
//                success.pagination.hasMore ? self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"]) : self.viewDelegate?.renderLoadingLists(loadingLists: [])
                self.playerLoadingLists = success.pagination.hasMore ? ["loading"] : []
                self.viewDelegate?.hideLoading()
            case .failure(let failure):
                self.viewDelegate?.renderError(error: failure.localizedDescription)
                self.viewDelegate?.hideLoading()
            }
        }
    }
    
    func fetchCasterLists(gameType: GameType, status: FilterStatus) {
        if self.currentPage == 1 {
            viewDelegate?.showLoading()
        }
        let router = ApiRouter.fetchCasterLists(selectedGameType, status, currentPage)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<CasterObject>,NetworkError>) in
            switch result {
            case .success(let success):
                if success.pagination.currentPage == 1 {
                    self.rankLists = success.data
                    self.viewDelegate?.renderCoverImage(url: success.data.last?.coverImageFullPath ?? "")
                } else {
                    self.rankLists.append(contentsOf: success.data)
                }
                self.currentPage = success.pagination.currentPage + 1
//                self.viewDelegate?.renderRankLists(lists: self.rankLists)
                self.casterLists = success.data
//                success.pagination.hasMore ? self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"]) : self.viewDelegate?.renderLoadingLists(loadingLists: [])
                self.casterLoadingLists = success.pagination.hasMore ? ["loading"] : []
                self.viewDelegate?.hideLoading()
            case .failure(let failure):
                self.viewDelegate?.renderError(error: failure.localizedDescription)
                self.viewDelegate?.hideLoading()
            }
        }
    }
    
    func fetchCreatorLists(gameType: GameType, status: FilterStatus) {
        if self.currentPage == 1 {
            viewDelegate?.showLoading()
        }
        let router = ApiRouter.fetchCreatorLists(selectedGameType, status, currentPage)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<CreatorObject>, NetworkError>) in
            switch result {
            case .success(let success):
                if success.pagination.currentPage == 1 {
                    self.rankLists = success.data
                    self.viewDelegate?.renderCoverImage(url: success.data.first?.coverImageFullURL ?? "")
                } else {
                    self.rankLists.append(contentsOf: success.data)
                }
                self.creatorLists = success.data
//                self.viewDelegate?.renderRankLists(lists: self.rankLists)
//                success.pagination.hasMore ? self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"]) : self.viewDelegate?.renderLoadingLists(loadingLists: [])
                self.creatorLoadingLists = success.pagination.hasMore ? ["loading"] : []
                self.viewDelegate?.hideLoading()
            case .failure(let failure):
                self.viewDelegate?.renderError(error: failure.localizedDescription)
                self.viewDelegate?.hideLoading()
            }
        }
    }
    
    func continuePagination() {
        switch rankCategory {
        case .team:
            fetchTeamLists(gameType: .All, status: .all)
        case .player:
            fetchPlayerLists(gameType: .All, status: .active)
        case .caster:
            fetchCasterLists(gameType: .All, status: .active)
        case .creator:
            fetchCreatorLists(gameType: .All, status: .active)
        }
    }
    
    func tappedFilerSettingBtn() {
        router?.routeToFilterSettings(category: selectedCategory)
    }
    
    func tappedSearchBtn() {
        router?.routeToSearch(category: selectedCategory)
    }
    
    func tappedRankItem(id: Int) {
        router?.routeToDetails(category: selectedCategory, id: id)
    }
    
    func changedRankCategory(category: RankCategory) {
        rankCategory = category
    }
    
    func changedGameType(game: GameType) {
        guard game != selectedGameType else { return }
        self.resetPagination()
        self.resetData()
        self.selectedGameType = game
        switch selectedCategory {
        case .team:
            self.fetchTeamLists(gameType: game, status: .all)
        case .player:
            self.fetchPlayerLists(gameType: game, status: .active)
        case .caster:
            self.fetchCasterLists(gameType: game, status: .active)
        case .creator:
            self.fetchCreatorLists(gameType: game, status: .active)
        }
    }
    
    func resetPagination() {
        self.currentPage = 1
    }
    
    func resetData() {
        self.rankLists = []
    }
    
}



