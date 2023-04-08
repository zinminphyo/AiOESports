//
//  RankPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation


class RankPresenter: RankPresenting {
    
    var router: RankRouting?
    
    var viewDelegate: RankViewDelegate?
    
    private var teamLists: [TeamObject] = []
    private var rankLists: [RankPresentable] = []
    
    private var selectedCategory: RankCategory = .team
    private var currentPage: Int = 1
    
    func fetchTeamLists(gameType: GameType, status: FilterStatus) {
        if self.currentPage == 1 {
            viewDelegate?.showLoading()
        }
        let router = ApiRouter.fetchTeamLists(gameType, status, currentPage)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<TeamObject>,NetworkError>) in
            switch result {
            case .success(let success):
                if success.pagination.currentPage == 1 {
                    self.teamLists = success.data
                } else {
                    self.teamLists.append(contentsOf: success.data)
                }
                self.viewDelegate?.renderTeamLists(teamLists: self.teamLists)
                self.currentPage = success.pagination.currentPage + 1
                success.pagination.hasMore ? self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"]) : self.viewDelegate?.renderLoadingLists(loadingLists: [])
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
        let router = ApiRouter.fetchPlayerLists(gameType, status, currentPage)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<PlayerObject>,NetworkError>) in
            switch result {
            case .success(let success):
                if success.pagination.currentPage == 1 {
                    self.rankLists = success.data
                } else {
                    self.rankLists.append(contentsOf: success.data)
                }
                self.currentPage = success.pagination.currentPage + 1
                self.viewDelegate?.renderRankLists(lists: self.rankLists)
                success.pagination.hasMore ? self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"]) : self.viewDelegate?.renderLoadingLists(loadingLists: [])
                self.viewDelegate?.hideLoading()
            case .failure(let failure):
                self.viewDelegate?.renderError(error: failure.localizedDescription)
                self.viewDelegate?.hideLoading()
            }
        }
    }
    
    func fetchCasterLists(gameType: GameType, status: FilterStatus) {
        
    }
    
    func fetchCreatorLists(gameType: GameType, status: FilterStatus) {
        
    }
    
    func tappedFilerSettingBtn() {
        router?.routeToFilterSettings(category: selectedCategory)
    }
    
    func tappedSearchBtn() {
        router?.routeToSearch()
    }
    
    func tappedRankItem() {
        router?.routeToDetails()
    }
    
    func changedRankCategory(category: RankCategory) {
        self.selectedCategory = category
    }
}



