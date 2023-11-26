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
    
    @Published
    var isUpdating: Bool = false
    var profileEditCompleted = PassthroughSubject<Void, Never>()
    
    init(info: ProfileInfoViewModel.ProfileInfo) {
        editInfo = ProfileEdit(info: info)
    }
    
    func updateProfile() {
        isUpdating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.isUpdating = false
            profileEditCompleted.send()
        }
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
