//
//  LoginResponseModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/05/2023.
//

import Foundation


struct LoginResponseModel: Decodable {
    let user: UserModel
    let frame: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case frame = "frame"
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decode(UserModel.self, forKey: .user)
        frame = try container.decode(String.self, forKey: .frame)
        token = try container.decode(String.self, forKey: .token)
    }
}
