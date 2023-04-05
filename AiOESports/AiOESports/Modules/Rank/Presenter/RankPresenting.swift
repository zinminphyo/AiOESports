//
//  RankPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation


protocol RankPresenting {
    var router: RankRouting? { get set }
    func fetchTeamLists()
    func tappedFilerSettingBtn()
}
