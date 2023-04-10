//
//  FormerPlayersViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol FormerPlayersViewDelegate {
    var presenter: FormerPlayersPresenting? { get set }
    func updateUI(formerPlayers: [FormerPlayerModel])
}
