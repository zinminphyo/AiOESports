//
//  PlayerOverview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation
import UIKit



enum PlayerOverviewModule {
    static func createModule(playerDetails: PlayerDetailsModel, social: [SocialModel], signatureLists: [SignatureModel]) -> PlayerOverview? {
        let st = UIStoryboard(name: String(describing: PlayerOverview.self), bundle: nil)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: PlayerOverview.self)) as? PlayerOverview else {
            return nil
        }
        let presenter = PlayerOverviewPresenter(details: playerDetails, social: social, signatureLists: signatureLists)
        presenter.viewDelegate = vc
        let router = PlayerOverviewRouter()
        presenter.router = router
        vc.presenter = presenter
        return vc
    }
}
