//
//  RankPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation


protocol RankPresenting {
    var router: RankRouting? { get set }
    var viewDelegate: RankViewDelegate? { get set }
    func fetchTeamLists(gameType: GameType, status: FilterStatus)
    func fetchPlayerLists(gameType: GameType, status: PlayerFilterStatus)
    func fetchCasterLists(gameType: GameType, status: FilterStatus)
    func fetchCreatorLists(gameType: GameType, status: FilterStatus)
    func changedRankCategory(category: RankCategory)
    func continuePagination()
    func tappedFilerSettingBtn()
    func tappedSearchBtn()
    func tappedRankItem(id: Int)
    func resetPagination()
    func resetData()
}
