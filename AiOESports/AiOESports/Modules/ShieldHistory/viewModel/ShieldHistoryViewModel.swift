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
}
