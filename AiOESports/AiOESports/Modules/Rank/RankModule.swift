//
//  RankModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import Foundation
import UIKit


enum RankModule {
    static func createModule() -> UIViewController? {
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
        presenter.viewDelegate = vc
        router.viewController = vc
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: false)
        nav.hidesBottomBarWhenPushed = true
        return nav
    }
}
