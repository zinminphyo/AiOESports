//
//  BuyShieldsViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/01/2024.
//

import Foundation
import Combine



class BuyShieldsViewModel {
    
    @Published
    var selectedIndex: Int? = nil
    
    private let service = BuyShieldsService()
    
    private(set) var shieldHistories: [BuyShieldsResponse.ShieldAmount] = []
    private(set) var bankLists: [String] = []
    private(set) var accountLists: [BuyShieldsResponse.Payment] = []
    private(set) var phoneNumber1: String = ""
    private(set) var phoneNumber2: String = ""
    private(set) var telegram: String = ""
    private(set) var viber: String = ""
    private(set) var messenger: String = ""
    
    var fetchingListsCompleted: PassthroughSubject<Void, Never> = .init()
    
    init() {
        selectedIndex = 0
    }
    
    func fetchShieldLists() {
        Task {
            do {
                let response = try await service.fetchLists()
                let dict = Dictionary(grouping: response.payment, by: { $0.platform })
                bankLists = dict.compactMap{ $0.key }
                accountLists = response.payment
                shieldHistories = response.shield_amount.filter{ $0.amount == "30" || $0.amount == "500" || $0.amount == "3000" || $0.amount == "10000" }
                phoneNumber1 = response.hotline.first(where: { $0.platform == "phone_one" } )?.number ?? ""
                phoneNumber2 = response.hotline.first(where: { $0.platform == "phone_two" })?.number ?? ""
                telegram = response.hotline.first(where: { $0.platform == "telegram" } )?.number ?? ""
                viber = response.hotline.first(where: { $0.platform == "viber" })?.number ?? ""
                messenger = response.hotline.first(where: { $0.platform == "messenger" })?.number ?? ""
                fetchingListsCompleted.send()
            } catch {
                print("Error in fetching shield lists \(error.localizedDescription)")
            }
        }
    }
    
    
}
