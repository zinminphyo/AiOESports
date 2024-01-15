//
//  MoreOfferViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import Foundation
import Combine


class MoreOfferViewModel {
    
    private let service = BuyShieldsService()
    
    var fetchingCompleted: PassthroughSubject<[BuyShieldsResponse.ShieldAmount], Never> = .init()
    
    @Published
    var isFetching: Bool = false
    
    init() {}
    
    func fetchShieldLists() {
        isFetching = true
        Task {
            do {
                let response = try await service.fetchLists()
                fetchingCompleted.send(response.shield_amount)
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isFetching = false
        }
    }
    
}
