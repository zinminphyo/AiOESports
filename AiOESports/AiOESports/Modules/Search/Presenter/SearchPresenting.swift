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
    func didFinishedSearching(result: [TeamSearchResultModel]?, error: String?)
}
