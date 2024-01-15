//
//  ForceVersionServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import Foundation


protocol ForceVersionServiceProtocol {
    func fetchForceVersion() async throws -> ForceVersionResponse
}
