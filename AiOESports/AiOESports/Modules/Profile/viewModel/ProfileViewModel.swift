//
//  ProfileViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 21/11/2023.
//

import Foundation
import Combine


class ProfileViewModel {
    
    private let service: UserProfileFetchingService
    private(set) var profileModel: UserProfileResponseModel = .init()
    
    
    @Published
    var isFetching: Bool = false
    var profileFetchingCompleted = PassthroughSubject<Void, Never>()
    
    
    init() {
        service = UserProfileFetchingService()
    }
    
    
    
    func fetchUserProfile() {
        isFetching = true
        Task {
            do {
                let response = try await service.fetchUserProfile()
                guard let usermodel = response.result else { return }
                profileModel = usermodel
            } catch {
                print("Error in profile fetching service is \(error.localizedDescription)")
            }
            isFetching = false
            profileFetchingCompleted.send()
        }
    }
    
    
}
