//
//  CasterOverviewPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


class CasterOverviewPresenter: CasterOverviewPresenting {
    
    var viewDelegate: CasterOverviewViewDelegate?
    
    private var details: PlayerDetails? = nil
    
    init(casterDetails: PlayerDetails) {
        self.details = casterDetails
    }
    
    func viewDidLoad() {
        guard let details = details else { return }
        self.viewDelegate?.renderUI(details: details)
    }
    
    
}
