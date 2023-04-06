//
//  BaseNetworkResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/04/2023.
//

import Foundation


struct PaginationNetworkResponse<T:Decodable>: Decodable {
    
    let data: [T]
    let pagination: Pagination
    
    enum CodingKeys: String, CodingKey {
        case data
        case result
        case pagination
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let resultContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
        data = try resultContainer.decode([T].self, forKey: .data)
        pagination = try resultContainer.decode(Pagination.self, forKey: .pagination)
    }
    
}
