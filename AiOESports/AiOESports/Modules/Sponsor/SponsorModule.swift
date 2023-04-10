//
//  SponsorModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation
import UIKit


enum SponsorModule {
    static func createModule(sponsorLists: [SponsorModel]) -> Sponsor? {
        let st = UIStoryboard(name: "Sponsor", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Sponsor.self)) as? Sponsor else { return nil }
        let presenter = SponsorPresenter()
        presenter.viewDelegate = vc
        presenter.set(sponsorLists: sponsorLists)
        vc.presenter = presenter
        return vc
    }
}
