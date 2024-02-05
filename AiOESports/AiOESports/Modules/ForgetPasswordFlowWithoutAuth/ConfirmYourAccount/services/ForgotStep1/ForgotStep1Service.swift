//
//  ForgotStep1Service.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/02/2024.
//

import Foundation
import Alamofire


struct ForgotStep1Service: ForgotStep1ServiceProtocol {
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/step1-reset")!
    }
    func step1Reset(phoneNumber: String) async throws {
        let params: Parameters = [
            "phone-number" : phoneNumber
        ]
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).serializingData()
        let response = await request.response
        let data = try response.result.get()
        let decoder = JSONDecoder()
        let baseResponse = try decoder.decode(BaseResponseModel<Empty>.self, from: data)
        guard baseResponse.statusCode == 200 else {
            throw AuthrizationError.cannotRetrieveToken
        }
    }
}
