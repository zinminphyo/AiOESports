//
//  FormerPlayersPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


class FormerPlayersPresenter: FormerPlayersPresenting {
    
    var viewDelegate: FormerPlayersViewDelegate?
    
    private var playerLists: [FormerPlayerModel] = []
    
    func viewDidLoad() {
        self.viewDelegate?.updateUI(formerPlayers: playerLists)
    }
    
    func set(playerLists: [FormerPlayerModel]) {
        self.playerLists = playerLists
    }
    
}
