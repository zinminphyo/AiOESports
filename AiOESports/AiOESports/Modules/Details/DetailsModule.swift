//
//  DetailsModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation
import UIKit


enum DetailsModuel {
    static func createModule(category: RankCategory, id: Int) -> Details? {
        let st = UIStoryboard(name: "Details", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Details.self)) as? Details else { return nil }
        vc.hidesBottomBarWhenPushed = true
        let presenter = DetailsPresenter(category: category, id: id)
        presenter.viewDelegate = vc
        vc.presenter = presenter
        return vc
    }
}
