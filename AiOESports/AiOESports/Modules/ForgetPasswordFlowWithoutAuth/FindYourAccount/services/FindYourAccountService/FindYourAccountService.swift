//
//  FindYourAccountService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/02/2024.
//

import Foundation
import Alamofire

struct FindYourAccountService: FindYourAccountServiceProtocol {
    
    let url = URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/search/phone")!
    
    func search(_ phoneNumber: String) async throws -> FindYourAccountResponse? {
        /*
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let headers: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
         */
        let params: Parameters = [
            "phone-number" : phoneNumber
        ]
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).serializingData()
        let response = await request.response
        let data = try response.result.get()
        let baseResponse = try JSONDecoder().decode(BaseResponseModel<[FindYourAccountResponse]>.self, from: data)
        return baseResponse.result?.first
    }
}
