//
//  RankViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import UIKit


protocol RankViewDelegate {
    var presenter: RankPresenter? { get set }
    func renderTeamLists(teamLists: [TeamObject])
    func renderPlayerLists(playerLists: [PlayerObject])
    func renderRankLists(lists: [RankPresentable])
    func renderLoadingLists(loadingLists: [String])
    func renderCoverImage(url: String)
    func renderError(error: String)
    func showLoading()
    func hideLoading()
}
