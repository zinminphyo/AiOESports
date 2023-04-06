//
//  RankViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import UIKit


protocol RankViewDelegate {
    var presenter: RankPresenting? { get set }
    func renderTeamLists(teamLists: [TeamObject])
    func renderLoadingLists(loadingLists: [String])
    func renderError(error: String)
}
