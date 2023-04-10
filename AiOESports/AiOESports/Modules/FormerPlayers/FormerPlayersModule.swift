//
//  FormerPlayersModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation
import UIKit

enum FormerPlayersModule {
    static func createModule(formerPlayers: [FormerPlayerModel]) -> FormerPlayers? {
        let st = UIStoryboard(name: "FormerPlayers", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: FormerPlayers.self)) as? FormerPlayers else { return nil }
        let presenter = FormerPlayersPresenter()
        presenter.viewDelegate = vc
        presenter.set(playerLists: formerPlayers)
        vc.presenter = presenter
        return vc
    }
}
