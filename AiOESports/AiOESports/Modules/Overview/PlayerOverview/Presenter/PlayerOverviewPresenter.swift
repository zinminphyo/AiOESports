//
//  PlayerOverviewPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


class PlayerOverviewPresenter: PlayerOverviewPresenting {
    
    private var details: PlayerDetailsModel? = nil
    private var social: [SocialModel] = []
    
    init(details: PlayerDetailsModel, social: [SocialModel]) {
        self.details = details
        self.social = social
    }
    
    var viewDelegate: PlayerOverviewViewDelegate?
    
    func viewDidLoad() {
        guard let details = details else { return }
        self.viewDelegate?.renderDetails(details: details, social: social)
    }
    
    
}
