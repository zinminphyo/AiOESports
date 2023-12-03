//
//  CasterOverviewModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation
import UIKit


enum CasterOverviewModule {
    static func createModule(details: CasterDetails) -> CasterOverview? {
        let st = UIStoryboard(name: "CasterOverview", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: CasterOverview.self)) as? CasterOverview else { return nil }
        let presenter = CasterOverviewPresenter(casterDetails: details)
        presenter.viewDelegate = vc
        let router = CasterOverviewRouter()
        presenter.router = router
        vc.presenter = presenter
        return vc
    }
}
