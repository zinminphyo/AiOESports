//
//  SearchPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


class SearchPresenter: SearchPresenting {
    
    var viewDelegate: SearchViewDelegate?
    
    var interactor: SearchInteracting?
    
    func searchTeamLists(keyword: String) {
        viewDelegate?.showLoading()
        interactor?.searchTeamLists(keyword: keyword)
    }

    func didFinishedSearching(result: [TeamSearchResultModel]?, error: String?) {
        if let result = result {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderTeamLists(teamLists: result)
        }else if let error = error {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderError(error: error)
        }
    }
}
