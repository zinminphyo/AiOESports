//
//  HomeInteractor.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


class HomeInteractor: HomeInteracting {
    var presenterDelegate: HomePresenting?
    
    func fetchHomeData() {
        let router = ApiRouter.home
        NetworkService.shared.request(router: router) { (result: Result<HomeModel, NetworkError>) in
            switch result {
            case .success(let success):
                self.presenterDelegate?.didFinishedHomeDataFetching(bannerLists: success.bannerLists, adLists: success.adLists, error: nil)
            case .failure(let failure):
                self.presenterDelegate?.didFinishedHomeDataFetching(bannerLists: nil, adLists: nil, error: failure.localizedDescription)
            }
        }
    }
    
    
}
