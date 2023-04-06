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
                self.presenterDelegate?.didFinishedSearching(result: success.data, error: nil)
            case .failure(let failure):
                self.presenterDelegate?.didFinishedSearching(result: nil, error: failure.localizedDescription)
            }
        }
    }
}
