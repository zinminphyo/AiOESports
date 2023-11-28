//
//  SearchViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation



protocol SearchViewDelegate: LoadingPresentable {
    var presenter: SearchPresenter? { get set } 
    func renderTeamLists(teamLists: [TeamSearchResultModel])
    func renderPlayerLists(playerLists: [PlayerSearchResultModel])
    func renderError(error: String)
}
