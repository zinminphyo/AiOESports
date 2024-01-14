//
//  BuyShieldsServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/01/2024.
//

import Foundation


protocol BuyShieldsServiceProtocol {
    func fetchLists() async throws -> BuyShieldsResponse
}
