//
//  UserProfileFetchingServiceProrocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation


protocol UserProfileFetchingServiceProrocol {
    func fetchUserProfile() async throws -> BaseResponseModel<UserProfileResponseModel>
}
