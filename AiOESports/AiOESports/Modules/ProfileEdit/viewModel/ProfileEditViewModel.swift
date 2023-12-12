//
//  ProfileEditViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation
import Combine
import UIKit


class ProfileEditViewModel {
    
    let id: Int
    
    var editInfo: ProfileEdit
    
    var updateInfo = [String:Any]()
    
    
    
    @Published
    var isUpdating: Bool = false
    var profileEditCompleted = PassthroughSubject<Void, Never>()
    
    init(info: ProfileInfoViewModel.ProfileInfo) {
        id = info.id
        editInfo = ProfileEdit(info: info)
    }
    
    func updateProfile() {
        isUpdating = true
        let updateService = ProfileUpdateService(id: id)
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
    
    func set(username: String) {
        updateInfo["username"] = username
    }
    
    func set(phoneNumber: String) {
        
    }
    
    func set(image: UIImage) {
        updateInfo["profile_image"] = image
    }
    
    
    func set(dob: String) {
        updateInfo["date-of-birth"] = dob
    }
    
    func set(state: String) {
        updateInfo["state"] = state
    }
    
    func set(city: String) {
        updateInfo["city"] = city
    }
    
    func set(gender: String) {
        updateInfo["gender"] = gender
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
        var level: String = ""
        var facebook: String? = nil
        var instagram: String? = nil
        
        init(info: ProfileInfoViewModel.ProfileInfo) {
            profileURL = info.profileURL
            username = info.username
            phoneNumber = info.phoneNumber
            gender = info.gender
            dateOfBirth = info.dateOfBirth
            level = info.level
            city = info.city
            state = info.state
            facebook = info.facebook
            instagram = info.instagram
        }
    }
}
