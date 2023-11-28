//
//  UpgradePremiumService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import Foundation
import Alamofire


struct UpgradePremiumService: UpgradePremiumServiceProtocol {
    
    var url: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/upgrade")!
    }
    
    
    func upgrade(pincode: String) async throws -> BaseResponseModel<Empty> {
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let params: Parameters = [
            "password" : pincode
        ]
        let request = AF.request(url, method: .post, parameters: params, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(BaseResponseModel<Empty>.self, from: data)
    }
}

enum AuthrizationError: Error {
    case cannotRetrieveToken
}
