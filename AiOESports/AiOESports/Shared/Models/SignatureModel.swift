//
//  SignatureModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation



struct SignatureModel: Decodable {
    let id: Int
    let playerId: String
    let signature: String
    
    var signatureImageFullPath: String {
        return NetworkBaseURLs.shared.baseURL + "/" + signature
    }
    
    enum CodingKeys: String, CodingKey {
        case id, signature
        case playerId = "player_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        playerId = try container.decodeIfPresent(String.self, forKey: .playerId) ?? ""
        signature = try container.decodeIfPresent(String.self, forKey: .signature) ?? ""
    }
}
