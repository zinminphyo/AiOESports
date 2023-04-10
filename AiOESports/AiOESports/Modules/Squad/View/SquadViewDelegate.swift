//
//  SquadViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


protocol SquadViewDelegate {
    var viewModel: SquadViewModel? { get set }
    func renderView(squad: SquadModel)
}
