//
//  SquadModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation
import UIKit

enum SquadModule {
    static func createModule(squad: SquadModel) -> Squad? {
        let st = UIStoryboard(name: "Squad", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Squad.self)) as? Squad else { return nil }
        let viewModel = SquadViewModel(squadModel: squad)
        viewModel.viewDelegate = vc
        vc.viewModel = viewModel
        return vc
    }
    
    static func createModule(playerAchivement: PlayerAchivement) -> Squad? {
        let st = UIStoryboard(name: "Squad", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Squad.self)) as? Squad else { return nil }
        let viewModel = SquadViewModel(achivementModel: playerAchivement)
        viewModel.viewDelegate = vc
        vc.viewModel = viewModel
        return vc
    }
    
}
