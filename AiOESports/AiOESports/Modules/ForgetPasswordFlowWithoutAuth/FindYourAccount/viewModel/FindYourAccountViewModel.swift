//
//  FindYourAccountViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/02/2024.
//

import Foundation
import Combine


class FindYourAccountViewModel {
    
    @Published
    var phoneNumberIsCorrect: Bool = false
    
    private let service: FindYourAccountServiceProtocol
    
    
    typealias FindingStatus = Status
    var findingStatus: PassthroughSubject<FindingStatus, Never> = .init()
    enum Status {
        case inProgress
        case success(account: FindYourAccountResponse)
        case failed(error: String)
    }
    
    init() {
        service = FindYourAccountService()
    }
    
    func search(_ phoneNumber: String) {
        findingStatus.send(.inProgress)
        Task {
            do {
                guard let response = try await service.search(phoneNumber) else {
                    return
                }
                findingStatus.send(.success(account: response))
            } catch {
                print("Error is \(error.localizedDescription)")
                findingStatus.send(.failed(error: error.localizedDescription))
            }
        }
    }
    
}
