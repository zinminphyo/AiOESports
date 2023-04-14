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
    private var achivementModel: PlayerAchivement? = nil
    
    init(squadModel: SquadModel) {
        self.squadModel = squadModel
    }
    
    init(achivementModel: PlayerAchivement) {
        self.achivementModel = achivementModel
    }
    
    
    func viewDidLoad() {
        if let achivementModel = achivementModel {
            self.viewDelegate?.renderView(achivement: achivementModel)
        }
        
        guard let squadModel = squadModel else { return }
        self.viewDelegate?.renderView(squad: squadModel)
    }
}
