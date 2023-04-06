//
//  Pagination.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation


struct Pagination: Decodable {
    
    let lastPage: Int
    let currentPage: Int
    let perPage: Int
    let totalItems: Int
    var hasMore: Bool {
        return currentPage < lastPage
    }
    
    enum CodingKeys: String, CodingKey {
        case lastPage = "lastPage"
        case currentPage = "currentPage"
        case perPage, totalItems
    }
}
