//
//  SquadViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation


class SquadViewModel {
    
    var viewDelegate: SquadViewDelegate? = nil
    
    private var squadModel: SquadModel? = nil
    
    init(squadModel: SquadModel) {
        self.squadModel = squadModel
    }
    
    func viewDidLoad() {
        guard let squadModel = squadModel else { return }
        self.viewDelegate?.renderView(squad: squadModel)
    }
}
