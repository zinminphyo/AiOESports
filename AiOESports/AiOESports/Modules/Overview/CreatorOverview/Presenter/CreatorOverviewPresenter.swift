//
//  CreatorOverviewPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/04/2023.
//

import Foundation


class CreatorOverviewPresenter: CreatorOverviewPresenting {
    
    init(details: PlayerDetails) {
        self.details = details
    }
    
    private var details: PlayerDetails? = nil
    
    var viewDelegate: CreatorOverviewViewDelegate?
    
    func viewDidLoad() {
        guard let details = details else { return }
        self.viewDelegate?.renderUI(details: details)
    }
    
    
}
