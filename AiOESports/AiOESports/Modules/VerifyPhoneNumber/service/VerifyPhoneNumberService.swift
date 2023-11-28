//
//  VerifyPhoneNumberService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Alamofire


struct VerifyPhoneNumberService: VerifyPhoneNumberServiceProtocol {
    
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/step2-reset")!
    }
    
    func verify(phoneNum: String, otp: String) async throws -> Bool {
        let params: Parameters = [
            "phone-number" : phoneNum,
            "otp" : otp
        ]
        let request = AF.request(url, method: .post, parameters: params).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseResponse = try decoder.decode(BaseResponseModel<Empty>.self, from: data)
        
        return baseResponse.statusCode == 200
    }
}
