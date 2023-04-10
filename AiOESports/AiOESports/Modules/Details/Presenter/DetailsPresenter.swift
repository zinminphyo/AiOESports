//
//  DetailsPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation


class DetailsPresenter: DetailsPresenting {
    
    init(category: RankCategory, id: Int) {
        self.category = category
        self.id = id
    }
    
    var viewDelegate: DetailsViewDelegate?
    
    private var category: RankCategory = .team
    private var id: Int = 0
    
    func fetchDetails() {
        let router = ApiRouter.teamDetails(id)
        NetworkService.shared.request(router: router) { (result: Result<TeamDetails, NetworkError>) in
            switch result {
            case .success(let success):
                self.viewDelegate?.renderDetails(details: success)
            case .failure(let failure):
                print("Failure is \(failure)")
            }
        }
    }
    
    
}
