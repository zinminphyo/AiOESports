//
//  SearchInteracting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


protocol SearchInteracting {
    var presenterDelegate: SearchPresenting? { get set }
    func searchTeamLists(keyword: String)
}
