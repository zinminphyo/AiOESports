//
//  BuyShieldsResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/01/2024.
//

import Foundation


struct BuyShieldsResponse: Decodable {
    
    let payment: [Payment]
    let hotline: [Hotline]
    let shield_amount: [ShieldAmount]
    
    struct Payment: Decodable {
        let id: Int
        let name: String
        let platform: String
        let acc_number: String
        let created_at: String?
        let updated_at: String?
    }
    
    struct Hotline: Decodable {
        let id: Int
        let number: String
        let platform: String
        let created_at: String?
        let updated_at: String?
    }
    
    struct ShieldAmount: Decodable {
        let amount: String
        let total_price: String
        let extra: String?
    }
    
}
