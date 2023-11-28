//
//  UpgradePreminumViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import Foundation
import Combine

class UpgradePreminumViewModel {
    
    let shieldCount: Int

    init(shieldCount: Int) {
        self.shieldCount = shieldCount
    }
    
    private let service = UpgradePremiumService()
    
    @Published
    var isPasscodeEntered: Bool = false
    
    @Published
    var isUpgrading: Bool = false
    
    var upgradeStatusCompletion = PassthroughSubject<UpgradeStatus, Never>()
    enum UpgradeStatus {
        case success
        case failed(error: String)
    }
    
    private var pincode: String = ""
    
    
    func upgrade() {
        isUpgrading = true
        Task {
            do {
                let response = try await service.upgrade(pincode: pincode)
                if response.statusCode == 200 {
                    upgradeStatusCompletion.send(.success)
                } else {
                    upgradeStatusCompletion.send(.failed(error: response.message))
                }
            } catch {
                print("Error in premium upgrade is \(error.localizedDescription)")
            }
            isUpgrading = false
        }
    }
    
    
    func set(pin: String) {
        pincode = pin
        isPasscodeEntered = pincode.count == 6
    }
}
