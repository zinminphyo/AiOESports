//
//  ProfileEditViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation
import Combine


class ProfileEditViewModel {
    
    var editInfo: ProfileEdit
    
    var updateInfo = [String:Any]()
    
    private let updateService = ProfileUpdateService()
    
    @Published
    var isUpdating: Bool = false
    var profileEditCompleted = PassthroughSubject<Void, Never>()
    
    init(info: ProfileInfoViewModel.ProfileInfo) {
        editInfo = ProfileEdit(info: info)
    }
    
    func updateProfile() {
        isUpdating = true
        Task {
            do {
                let response = try await updateService.update(updateInfo: updateInfo)
                print("Update response is \(response)")
                profileEditCompleted.send()
            } catch {
                print("Error in update profile service is \(error.localizedDescription)")
            }
            isUpdating = false
        }
    }
    
}

extension ProfileEditViewModel {
    func set(facebookLink: String) {
        updateInfo["facebook_link"] = facebookLink
    }
    
    func set(instagramLink: String) {
        updateInfo["instagram_link"] = instagramLink
    }
}


extension ProfileEditViewModel {
    struct ProfileEdit {
        var profileURL: String = ""
        var username: String = ""
        var phoneNumber: String = ""
        var gender: String = ""
        var dateOfBirth: String = ""
        var city: String = ""
        var state: String = ""
        
        init(info: ProfileInfoViewModel.ProfileInfo) {
            profileURL = info.profileURL
            username = info.username
            phoneNumber = info.phoneNumber
            gender = info.gender
            dateOfBirth = info.dateOfBirth
            city = info.city
            state = info.city
        }
    }
}
