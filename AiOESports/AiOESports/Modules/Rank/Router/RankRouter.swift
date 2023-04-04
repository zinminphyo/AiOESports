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
    
    
}
