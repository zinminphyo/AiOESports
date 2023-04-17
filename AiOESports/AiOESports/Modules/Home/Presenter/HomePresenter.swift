//
//  HomePresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


class HomePresenter: HomePresenting {
    
    var viewDelegate: HomeViewDelegate?
    
    var interactor: HomeInteracting?
    
    func viewDidLoad() {
        interactor?.fetchHomeData()
    }
    
    func didFinishedHomeDataFetching(bannerLists: [BannerModel]?, adLists: [AdvertisementModel]?, error: String?) {
        if let error = error {
            self.viewDelegate?.renderError(string: error)
        } else {
            self.viewDelegate?.renderUI(bannerLists: bannerLists ?? [], adLists: adLists ?? [])
        }
    }
    
    
}
