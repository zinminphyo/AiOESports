//
//  ProfileUpdateServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation


protocol ProfileUpdateServiceProtocol {
    func update(updateInfo: [String:Any]) async throws -> BaseResponseModel<LoginResponseModel>
}
