//
//  RegistrationResponseModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/12/2023.
//

import Foundation


struct RegistrationResponseModel: Decodable {
    let user: RegistrationUserModel
    let frame: String
    let smspoh: String
}
