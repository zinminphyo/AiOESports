//
//  ShieldHistoryResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 20/01/2024.
//

import Foundation



struct ShieldHistory: Decodable {
    let id: Int
    let user_id: String
    let amount: Int
    let description: String
    let detail: String
    let talent_id: String?
    let team_id: String?
    let created_at: String
    let updated_at: String
}

typealias ShieldHistories = [ShieldHistory]
