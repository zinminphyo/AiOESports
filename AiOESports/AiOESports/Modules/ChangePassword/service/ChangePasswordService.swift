//
//  ChangePasswordService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Alamofire


struct ChangePasswordService: ChangePasswordServiceProtocol {
    
    let userId: String
    
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/update/password/")!
    }
    
    func changePassword(currentPassword: String, newPassword: String) async throws -> Bool {
        let url = url.appendingPathComponent(userId)
        guard let token = UserDataModel.shared.getToken() else {
            return false
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let params: Parameters = [
            "old-password" : currentPassword,
            "new-password" : newPassword,
            "new-password_confirmation" : newPassword
        ]
        let request = AF.request(url, method: .post, parameters: params, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        guard let baseResponse = try? decoder.decode(BaseResponseModel<Empty>.self, from: data) else {
            return false
        }
        
        return baseResponse.statusCode == 200
        
        
    }
    
    
    func forgotpassword(
        phoneNumber: String,
        newPassword: String
    ) async throws -> Bool {
        let url = URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/step3-reset")!
        let params: Parameters = [
            "phone-number" : phoneNumber,
            "password" : newPassword,
            "password_confirmation" : newPassword
        ]
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).serializingData()
        let response = await request.response
        let data = try response.result.get()
        let decoder = JSONDecoder()
        return try decoder.decode(BaseResponseModel<Empty>.self, from: data).statusCode == 200
    
    }
    
}

struct Empty: Decodable {}
