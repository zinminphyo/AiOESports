//
//  Step1RegistrationService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/12/2023.
//

import Foundation
import Alamofire

struct Step1RegistrationService: Step1RegistrationServiceProtocol {
    
    var baseURL: URL {
        return URL(string: NetworkBaseURLs.shared.baseURL)!
    }
    
    func register(username: String, phonenum: String, password: String) async throws -> BaseResponseModel<RegistrationResponseModel> {
        let url = baseURL.appendingPathComponent("api/register")
        let params: Parameters = [
            "username" : username,
            "phone-number" : phonenum,
            "password" : password
        ]
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(BaseResponseModel<RegistrationResponseModel>.self, from: data)
    }
    
    
}
