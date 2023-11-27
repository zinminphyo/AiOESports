//
//  ChangePasswordService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Alamofire


class ChangePasswordService: ChangePasswordServiceProtocol {
    
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/update/password/")!
    }
    
    func changePassword(currentPassword: String, newPassword: String) async throws -> Bool {
        let url = url.appendingPathComponent("1026")
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
    
    
}

struct Empty: Decodable {}
