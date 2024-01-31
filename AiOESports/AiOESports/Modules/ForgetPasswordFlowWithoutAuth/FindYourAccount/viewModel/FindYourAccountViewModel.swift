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
    
    
    typealias FindingStatus = Status
    var findingStatus: PassthroughSubject<FindingStatus, Never> = .init()
    enum Status {
        case inProgress
        case success
        case failed(error: String)
    }
    
    func search() {
        findingStatus.send(.inProgress)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let flag = Bool.random()
            if flag  {
                self?.findingStatus.send(.success)
            } else {
                self?.findingStatus.send(.failed(error: "Can't find your account."))
            }
        }
    }
    
}
