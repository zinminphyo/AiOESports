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
        let profileURL: String
        let username: String
        let phoneNumber: String
        let gender: String
        let dateOfBirth: String
        let city: String
    }
    
    
    let profileInfo: ProfileInfo
    
    init(info: ProfileInfo) {
        profileInfo = info
    }
    
}
