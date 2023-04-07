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
        guard let vc = FilterSettingModule.createModule(category: category) else { return }
        viewController?.present(vc, animated: true)
    }
    
    func routeToSearch() {
        guard let vc = SearchModule.createModule() else { return }
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
