//
//  UpgradePremiumServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import Foundation



protocol UpgradePremiumServiceProtocol {
    func upgrade(pincode: String) async throws -> BaseResponseModel<Empty>
}
