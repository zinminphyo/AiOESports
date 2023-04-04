//
//  RankPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation


class RankPresenter: RankPresenting {
    
    var router: RankRouting?
    
    func tappedFilerSettingBtn() {
        router?.routeToFilterSettings()
    }
}
