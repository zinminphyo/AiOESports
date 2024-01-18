//
//  BaseResponseModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/05/2023.
//

import Foundation


struct BaseResponseModel<T: Decodable>: Decodable {
    var result: T?
    let statusCode: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case statusCode = "statusCode"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decodeIfPresent(T.self, forKey: .result)
        statusCode = try container.decode(Int.self, forKey: .statusCode)
        message = try container.decode(String.self, forKey: .message)
    }
}
