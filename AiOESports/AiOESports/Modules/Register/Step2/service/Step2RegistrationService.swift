//
//  Step2RegistrationService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation
import Alamofire

struct Step2RegistrationService: Step2RegistrationServiceProtocol {
    
    var url: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/verify")!
    }
    
    func verify(pinCode: String, phoneNum: String) async throws -> BaseResponseModel<FinalRegistrationResponse> {
        let params: Parameters = [
            "phone-number" : phoneNum,
            "otp" : pinCode
        ]
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).serializingData()
        
        let response = await request.response
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(BaseResponseModel<FinalRegistrationResponse>.self, from: data)
        
    }
    
    
}
