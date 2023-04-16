//
//  SearchPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


protocol SearchPresenting {
    var viewDelegate: SearchViewDelegate? { get set }
    var interactor: SearchInteracting? { get set } 
    func searchTeamLists(keyword: String)
    func searchPlayerLists(keyword: String)
    func searchCasterLists(keyword: String)
    func searchCreatorLists(keyword: String)
    func didFinishedSearchingForGames(result: [TeamSearchResultModel]?, error: String?)
    func didFinishedSearchingForPlayers(result: [PlayerSearchResultModel]?, error: String?)
    func didFinishedSearchingForCasters(result: [PlayerSearchResultModel]?, error: String?)
    func didFinishedSearchingForCreators(result: [PlayerSearchResultModel]?, error: String?)
    func searchLists(keyword: String)
    func getRankCategory() -> RankCategory
}
