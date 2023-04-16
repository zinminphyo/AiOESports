//
//  SearchInteractor.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


class SearchInteractor: SearchInteracting {
    var presenterDelegate: SearchPresenting?
    
    func searchTeamLists(keyword: String) {
        let router = ApiRouter.teamSearch(keyword)
        NetworkService.shared.request(router: router) { [weak self] (result: Result<PaginationNetworkResponse<TeamSearchResultModel>, NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.presenterDelegate?.didFinishedSearchingForGames(result: success.data, error: nil)
            case .failure(let failure):
                self.presenterDelegate?.didFinishedSearchingForGames(result: nil, error: failure.localizedDescription)
            }
        }
    }
    
    func searchPlayerLists(keyword: String) {
        let router = ApiRouter.playerSearch(keyword)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<PlayerSearchResultModel>, NetworkError>) in
            switch result {
            case .success(let success):
                self.presenterDelegate?.didFinishedSearchingForPlayers(result: success.data, error: nil)
            case .failure(let failure):
                self.presenterDelegate?.didFinishedSearchingForPlayers(result: nil, error: failure.localizedDescription)
            }
        }
    }
    
    func searchCasterLists(keyword: String) {
        let router = ApiRouter.casterSearch(keyword)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<PlayerSearchResultModel>, NetworkError>) in
            switch result {
            case .success(let success):
                self.presenterDelegate?.didFinishedSearchingForCasters(result: success.data, error: nil)
            case .failure(let failure):
                self.presenterDelegate?.didFinishedSearchingForCasters(result: nil, error: failure.localizedDescription)
            }
        }
    }
    
    func searchCreatorLists(keyword: String) {
        let router = ApiRouter.creatorSearch(keyword)
        NetworkService.shared.request(router: router) { (result: Result<PaginationNetworkResponse<PlayerSearchResultModel>, NetworkError>) in
            switch result {
            case .success(let success):
                self.presenterDelegate?.didFinishedSearchingForCreators(result: success.data, error: nil)
            case .failure(let failure):
                self.presenterDelegate?.didFinishedSearchingForCreators(result: nil, error: failure.localizedDescription)
            }
        }
    }
}
