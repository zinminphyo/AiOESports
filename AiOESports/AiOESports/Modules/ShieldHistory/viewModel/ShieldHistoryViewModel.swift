//
//  ShieldHistoryViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/01/2024.
//

import Foundation
import Combine

class ShieldHistoryViewModel {
    
    
    private let service: ShieldHistoryServiceProtocol!
    
    @Published
    var shieldCount: Int = 0
    
    var fetchingCompleted: PassthroughSubject<ShieldHistories, Never> = .init()
    
    @Published
    var isFetching: Bool = false
    
    init() {
        service = ShieldHistoryService()
    }
    
    func fetchHistories() {
        isFetching = true
        Task {
            do {
                let response = try await service.fetchLists()
                fetchingCompleted.send(response)
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isFetching = false
        }
    }
    
    func fetchShieldCount() {
        let service = UserProfileFetchingService()
        Task {
            do {
                let response = try await service.fetchUserProfile()
                shieldCount = response.result?.shield ?? 0
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
}
