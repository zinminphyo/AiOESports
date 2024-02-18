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
    
    let service = ForceVersionService()
    
    @Published
    var isFetching: Bool = false
    
    @Published
    var shieldCount: Int = 0
    
    @Published
    var isUpdateAvailable: Bool = false
    
    @Published
    var isUnderMaintenance: Bool = false
    
    private(set) var appStoreURL: String = ""
    private(set) var isForceUpdate: Bool = false
    
    func viewDidLoad() {
        isFetching = true
        interactor?.fetchHomeData()
        fetchForceVersion()
        fetchShieldCount()
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
                shieldCount = 0
            }
        }
    }
    
    func fetchForceVersion() {
        
        Task {
            do {
                let response = try await service.fetchForceVersion()
                isUnderMaintenance = response.under_maintenance
                guard isUnderMaintenance == false else { return }
                isForceUpdate = response.isForceUpdate
                isUpdateAvailable = Int(response.version) ?? 1 >= 1
                appStoreURL = response.url
            } catch {
                print("Error is \(error.localizedDescription)")
                fetchForceVersion()
            }
        }
    }
    
    
}
