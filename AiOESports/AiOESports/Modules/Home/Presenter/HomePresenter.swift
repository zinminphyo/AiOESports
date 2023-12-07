//
//  HomePresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation
import Combine


class HomePresenter: HomePresenting {
    
    var viewDelegate: HomeViewDelegate?
    
    var interactor: HomeInteracting?
    
    @Published
    var isFetching: Bool = false
    
    @Published
    var shieldCount: Int = 0
    
    func viewDidLoad() {
        isFetching = true
        interactor?.fetchHomeData()
    }
    
    func didFinishedHomeDataFetching(bannerLists: [BannerModel]?, adLists: [AdvertisementModel]?, error: String?) {
        if let error = error {
            self.viewDelegate?.renderError(string: error)
        } else {
            self.viewDelegate?.renderUI(bannerLists: bannerLists ?? [], adLists: adLists ?? [])
        }
        isFetching = false
    }
    
    func fetchShieldCount() {
        let service = UserProfileFetchingService()
        Task {
            do {
                let response = try await service.fetchUserProfile()
                shieldCount = response.result?.shield ?? 0
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    
}
