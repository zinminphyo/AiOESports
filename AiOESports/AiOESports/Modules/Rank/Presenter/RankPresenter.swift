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
    
    func fetchTeamLists(gameType: GameType, status: FilterStatus) {
        viewDelegate?.showLoading()
        let router = ApiRouter.fetchTeamLists(gameType, status)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<TeamObject>,NetworkError>) in
            switch result {
            case .success(let success):
                self.teamLists = success.data
                self.viewDelegate?.renderTeamLists(teamLists: self.teamLists)
                self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"])
                self.viewDelegate?.hideLoading()
            case .failure(let failure):
                self.viewDelegate?.renderError(error: failure.localizedDescription)
                self.viewDelegate?.hideLoading()
            }
        }
         
//        self.viewDelegate?.renderLoadingLists(loadingLists: ["loading"])
    }
    
    func fetchPlayerLists(gameType: GameType, status: FilterStatus) {
        
    }
    
    func fetchCasterLists(gameType: GameType, status: FilterStatus) {
        
    }
    
    func fetchCreatorLists(gameType: GameType, status: FilterStatus) {
        
    }
    
    func tappedFilerSettingBtn() {
        router?.routeToFilterSettings()
    }
}



