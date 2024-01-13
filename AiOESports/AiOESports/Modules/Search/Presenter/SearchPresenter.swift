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
    
    private(set) var selectedCategory: RankCategory = .team
    
    var searchTitle: String {
        "Enter \(selectedCategory.title.capitalized) name"
    }
    
    init(category: RankCategory) {
        self.selectedCategory = category
    }
    
    func searchTeamLists(keyword: String) {
        viewDelegate?.showLoading()
        interactor?.searchTeamLists(keyword: keyword)
    }
    
    func searchPlayerLists(keyword: String) {
        viewDelegate?.showLoading()
        interactor?.searchPlayerLists(keyword: keyword)
    }
    
    func searchCasterLists(keyword: String) {
        viewDelegate?.showLoading()
        interactor?.searchCasterLists(keyword: keyword)
    }
    
    func searchCreatorLists(keyword: String) {
        viewDelegate?.showLoading()
        interactor?.searchCreatorLists(keyword: keyword)
    }
    
    func searchLists(keyword: String) {
        switch selectedCategory {
        case .team:
            searchTeamLists(keyword: keyword)
        case .player:
            searchPlayerLists(keyword: keyword)
        case .caster:
            searchCasterLists(keyword: keyword)
        case .creator:
            searchCreatorLists(keyword: keyword)
        }
    }

    func didFinishedSearchingForGames(result: [TeamSearchResultModel]?, error: String?) {
        if let result = result {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderTeamLists(teamLists: result)
        }else if let error = error {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderError(error: error)
        }
    }
    
    func didFinishedSearchingForPlayers(result: [PlayerSearchResultModel]?, error: String?) {
        if let result = result {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderPlayerLists(playerLists: result)
        } else if let error = error {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderError(error: error)
        }
    }
    
    func didFinishedSearchingForCasters(result: [PlayerSearchResultModel]?, error: String?) {
        if let result = result {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderPlayerLists(playerLists: result)
        } else if let error = error {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderError(error: error)
        }
    }
    
    func didFinishedSearchingForCreators(result: [PlayerSearchResultModel]?, error: String?) {
        if let result = result {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderPlayerLists(playerLists: result)
        } else if let error = error {
            self.viewDelegate?.hideLoading()
            self.viewDelegate?.renderError(error: error)
        }
    }
    
    func getRankCategory() -> RankCategory {
        return self.selectedCategory
    }
}
