//
//  ForceVersionResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import Foundation


struct ForceVersionResponse: Decodable {
    let version: String
    let force_update: Int
    var isForceUpdate: Bool {
        return force_update == 1
    }
    let under_maintenance: Bool
    let url: String
}
