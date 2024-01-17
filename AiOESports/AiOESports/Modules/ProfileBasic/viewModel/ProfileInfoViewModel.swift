//
//  ProfileInfoViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation
import Combine



class ProfileInfoViewModel {
    
    struct ProfileInfo {
        let id: Int
        let profileURL: String
        let username: String
        let phoneNumber: String
        let gender: String
        let dateOfBirth: String
        let level: String
        let city: String
        let state: String
        let facebook: String?
        let instagram: String?
    }
    
    
    let profileInfo: ProfileInfo
    
    init(info: ProfileInfo) {
        profileInfo = info
    }
    
    @Published
    var isFetching: Bool = false
    
    var userInfoFetchingCompleted = PassthroughSubject<UserInfo, Never>()
    
    
    func fetchProfile() {
        isFetching = true
        let service = UserInfoFetchingService()
        Task {
            do {
                let response = try await service.fetchUserInfo()
                userInfoFetchingCompleted.send(response)
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isFetching = false
        }
    }
}
