//
//  CreatorOverviewModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation
import UIKit


enum CreatorOverviewModule {
    static func createModuel(creatorDetails: PlayerDetails) -> CreatorOverview? {
        let st = UIStoryboard(name: "CreatorOverview", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: CreatorOverview.self)) as? CreatorOverview else { return nil }
        let presenter = CreatorOverviewPresenter(details: creatorDetails)
        presenter.viewDelegate = vc
        vc.presenter = presenter
        return vc
    }
}
