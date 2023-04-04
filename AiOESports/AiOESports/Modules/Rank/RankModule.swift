//
//  RankModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import Foundation
import UIKit


enum RankModule {
    static func createModule() -> Rank? {
        let st = UIStoryboard(name: "Rank", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Rank.self)) as? Rank else {
            return nil
        }
        vc.tabBarItem.image = Images.InAppImages.ranklogo
        vc.tabBarItem.title = "RANK"
        
        let presenter = RankPresenter()
        let router = RankRouter()
        vc.presenter = presenter
        presenter.router = router
        router.viewController = vc
        
        return vc
    }
}
