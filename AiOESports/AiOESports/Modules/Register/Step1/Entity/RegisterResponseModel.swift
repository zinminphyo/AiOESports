//
//  RegisterResponseModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/05/2023.
//

import Foundation


struct RegisterResponseModel: Decodable {
    let user: UserModel?
    let frame: String?
}
