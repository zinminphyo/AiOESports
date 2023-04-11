//
//  TeamOverviewModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation
import UIKit


enum TeamOverviewModule {
    static func createModule(teamDetails: TeamDetailsModel, social: [SocialModel]) -> TeamOverview? {
        let st = UIStoryboard(name: "TeamOverview", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: TeamOverview.self)) as? TeamOverview else { return nil }
        let presenter = TeamOverviewPresenter()
        presenter.viewDelegate = vc
        presenter.set(details: teamDetails, social: social)
        vc.presenter = presenter
        return vc
    }
}
