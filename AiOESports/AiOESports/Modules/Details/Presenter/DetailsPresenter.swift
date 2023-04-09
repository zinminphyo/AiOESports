//
//  DetailsPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation


class DetailsPresenter: DetailsPresenting {
    
    var viewDelegate: DetailsViewDelegate?
    
    func fetchDetails(id: Int) {
        let router = ApiRouter.teamDetails(id)
        NetworkService.shared.request(router: router) { (result: Result<TeamDetails, NetworkError>) in
            switch result {
            case .success(let success):
                print("Success is \(success)")
            case .failure(let failure):
                print("Failure is \(failure)")
            }
        }
    }
    
    
}
