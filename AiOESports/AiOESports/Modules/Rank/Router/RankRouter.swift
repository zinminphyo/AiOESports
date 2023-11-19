//
//  RankRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import UIKit


class RankRouter: RankRouting {
    
    var viewController: Rank?
    
    func routeToFilterSettings(category: RankCategory) {
        guard let delegate = viewController else { return }
        guard let vc = FilterSettingModule.createModule(category: category, delegate: delegate) else { return }
        viewController?.present(vc, animated: true)
    }
    
    func routeToSearch(category: RankCategory) {
        guard let vc = SearchModule.createModule(category: category) else { return }
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func routeToDetails(category: RankCategory, id: Int) {
//        guard let vc = DetailsModuel.createModule(category: category, id: id) else { return }
//        viewController?.navigationController?.pushViewController(vc, animated: true)
        let vc = DetailController()
        vc.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
