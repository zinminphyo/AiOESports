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
    
    func routeToFilterSettings() {
        guard let vc = FilterSettingModule.createModule() else { return }
        viewController?.present(vc, animated: true)
    }
    
    func routeToSearch() {
        guard let vc = SearchModule.createModule() else { return }
        viewController?.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
