//
//  GetPinCodeService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import Foundation
import Alamofire

struct GetPinCodeService: GetPinCodeServiceProtocol {
    
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/step1-reset")!
    }
    
    func getPinCode(phoneNumber: String) async throws -> Bool {
        let params: Parameters = [
            "phone-number" : phoneNumber
        ]
        let request = AF.request(url, method: .post, parameters: params)
            .serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseResponse = try decoder.decode(BaseResponseModel<Empty>.self, from: data)
        
        return baseResponse.statusCode == 200
    }
    
    
}
